#!/usr/bin/env bash
# macOS-specific recipes

load_recipe "mas-cli"
load_recipe "xcode"
load_recipe "macskk"
load_recipe "sequel-ace"
load_recipe "chatgpt"
load_recipe "obsidian"
load_recipe "raindropio"
load_recipe "the-unarchiver"
load_recipe "iterm2"
load_recipe "karabiner-elements"

# Load macos-defaults last to apply system preferences after all apps are installed
load_recipe "macos-defaults"