#!/bin/sh

# prepare files
sudo cp -f /etc/nixos/configuration.nix ./nixp/configuration.nix
cp -f ~/.config/nixpkgs/home.nix ./nixp/.config/nixpkgs/home.nix
cp -f ~/.config/nixpkgs/config.nix ./nixp/.config/nixpkgs/config.nix
cp -f ~/.config/i3/config ./nixp/.config/i3/config

# update git
git add .
git commit -m "copy_current_setting_then_push_to_git.sh"
git push origin master

# now update the nix system
sudo nixos-rebuild switch --install-bootloader
home-manager switch
