#!/bin/sh

git pull origin master

mkdir -p ~/.config/nixpkgs/
mkdir -o ~/.config/i3

# copy files
sudo cp -f ./nixp/configuration.nix /etc/nixos/configuration.nix
cp -f ./nixp/.config/nixpkgs/* ~/.config/nixpkgs/*
cp -f ./nixp/.config/i3/config ~/.config/i3/config

sudo nixos-rebuild switch --install-bootloader
home-manager switch