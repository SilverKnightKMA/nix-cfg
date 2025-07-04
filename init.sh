#!/usr/bin/env bash
# filepath: init.sh

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

sudo sh install.sh $hostname