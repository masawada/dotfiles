#!/bin/bash

if platform_is linux; then
  aur "visual-studio-code-bin"
elif platform_is darwin; then
  brew_cask "visual-studio-code"
fi

# Create VSCode config directory
create_directory "$HOME/.config/Code/User"

# Symlink settings if you have them
# dotfile "config/Code/User/settings.json" ".config/Code/User/settings.json"
# dotfile "config/Code/User/keybindings.json" ".config/Code/User/keybindings.json"