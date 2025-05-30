#!/usr/bin/env bash
# filepath: install.sh

# Get default hostname
default_hostname=$(hostname)

if [ -n "$1" ]; then
  hostname="$1"
else
  read -p "Enter machine name (hostname) [Default: ${default_hostname}]: " hostname
  hostname="${hostname:-$default_hostname}"
fi

git clone https://github.com/SilverKnightKMA/nix-cfg

cd nix-cfg

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko ./hosts/"$hostname"/disko-config.nix

sudo nixos-rebuild switch --flake ".#$hostname"