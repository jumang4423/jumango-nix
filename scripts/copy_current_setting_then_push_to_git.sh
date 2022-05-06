#!/bin/sh

# prepare files
sudo cp -f /etc/nixos/configuration.nix ./nixp/configuration.nix
rm -rf ./nixp/.config/nixpkgs
cp -f ~/.config/nixpkgs ./nixp/.config
cp -f ~/.config/i3/config ./nixp/.config/i3/config

# update git
git add .
git commit -m "copy_current_setting_then_push_to_git.sh"
git push origin master

# now update the nix system
sudo nixos-rebuild switch --install-bootloader
home-manager switch
