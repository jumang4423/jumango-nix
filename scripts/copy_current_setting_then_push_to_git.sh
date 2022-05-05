#!/bin/sh

# prepare files
cp -f /etc/nixos/configuration.nix ./nixp/configuration.nix
cp -f ~/.config/i3/config ./nixp/.config/i3/config

# update git
git add .
git commit -m "copy_current_setting_then_push_to_git.sh"
git push origin master