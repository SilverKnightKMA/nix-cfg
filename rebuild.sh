#!/usr/bin/env bash
# filepath: rebuild.sh

read -p "Nhập tên máy (hostname): " hostname
git pull
sudo nixos-rebuild switch --flake ".#$hostname"