#!/bin/sh

git pull origin master

# copy files
sudo cp -f ./nixp/configuration.nix /etc/nixos/configuration.nix
rm -rf ~/.config/nixpkgs
mkdir -p ~/.config/nixpkgs/pkgs
cp -f ./nixp/.config/nixpkgs ~/.config
mkdir -p ~/.config/i3
cp -f ./nixp/.config/i3/config ~/.config/i3/config

sudo nixos-rebuild switch --install-bootloader
home-manager switch