#!/bin/sh

# prepare files
sudo cp -rf /etc/nixos/configuration.nix ./nixp/configuration.nix
rm -rf ./nixp/.config/nixpkgs
cp -rf ~/.config/nixpkgs ./nixp/.config
cp -rf ~/.config/i3/config ./nixp/.config/i3/config
cp -rf ~/.tmux.conf ./nixp/tmux/.tmux.conf

# update git
git add .
git commit -m "copy_current_setting_then_push_to_git.sh"
git push origin master

# now update the nix system
sudo nixos-rebuild switch --install-bootloader
home-manager switch
