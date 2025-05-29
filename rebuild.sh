#!/usr/bin/env bash
# filepath: rebuild.sh

if [ -n "$1" ]; then
  hostname="$1"
else
  read -p "Nhập tên máy (hostname): " hostname
fi

git pull
sudo nixos-rebuild switch --flake ".#$hostname"