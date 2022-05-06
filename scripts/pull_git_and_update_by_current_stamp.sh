#!/bin/sh

git pull origin master

# copy files
sudo cp -f ./nixp/configuration.nix /etc/nixos/configuration.nix
cp -f ./nixp/.config/nixpkgs/home.nix ~/.config/nixpkgs/home.nix
cp -f ./nixp/.config/i3/config ~/.config/i3/config

sudo nixos-rebuild switch --install-bootloader
home-manager switch