#!/bin/sh

git pull origin master

# copy files
sudo cp -f ./nixp/configuration.nix /etc/nixos/configuration.nix
rm -rf ~/.config/nixpkgs
mkdir -p ~/.config/nixpkgs/pkgs
cp -rf ./nixp/.config/nixpkgs ~/.config
mkdir -p ~/.config/i3
cp -rf ./nixp/.config/i3/config ~/.config/i3/config
mkdir -p ~/.config/tmux
cp -rf ./nixp/.config/tmux/.tmux.conf ~/.tmux.conf

sudo nixos-rebuild switch --install-bootloader
home-manager switch
