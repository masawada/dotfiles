#!/usr/bin/env bash

# this file is the entry point for the provision script
# don't execute this file directly, use script/provision instead

set -eu

# user defined variables
export RUN="${RUN:-0}"
export DEBUG="${DEBUG:-0}"

## define environments
# DOT_DIR is defined on script/provision
export DOT_DIR="$DOT_DIR"
export LIB_DIR="$DOT_DIR/lib"
export CONFIG_DIR="$DOT_DIR/config"
export RECIPES_DIR="$DOT_DIR/recipes"

## load libraries
source "$LIB_DIR/core.sh"
source "$LIB_DIR/functions.sh"
source "$LIB_DIR/recipe_helpers.sh"

## validate commands
check_command "git"
check_command "curl"
check_command "tar"
check_command "unzip"

## reset current directory
cd "$DOT_DIR";

## print mode
if [ "$RUN" == 1 ]; then
  log_info "Running in provision mode"
else
  log_info "Running in dry-run mode"
fi

## reset sudo timeout
sudo -k
if [ "$RUN" == 1 ]; then
  sudo -v
fi

## extend sudo timeout
extend_sudo_timeout

## load recipes
# env RECIPE_DIR is defined in load_recipe function

load_recipe "yay"
load_recipe "update"

# basics
load_recipe "git"
load_recipe "vim"
load_recipe "zsh"
load_recipe "tmux"
load_recipe "ssh-agent"

# tools
load_recipe "ntp"
load_recipe "dhclient"
load_recipe "netctl"
load_recipe "inetutils"
load_recipe "dnsmasq"
load_recipe "dnsutils"
load_recipe "lsof"
load_recipe "ghq"
load_recipe "peco"
load_recipe "docker"
load_recipe "tree"
load_recipe "clipboard"
load_recipe "percona-toolkit"
load_recipe "whois"
load_recipe "gnome-keyring"
load_recipe "envchain"
load_recipe "mariadb"
load_recipe "redis"
load_recipe "imagemagick"
load_recipe "ansible"

# langs
load_recipe "perl"
load_recipe "ruby"
load_recipe "node"
load_recipe "go"

# desktop environments
load_recipe "x11"
load_recipe "i3"
load_recipe "pulseaudio"
load_recipe "Xresources"
load_recipe "xinput"
load_recipe "xrandr"
load_recipe "picom"
load_recipe "gnome-terminal"
load_recipe "polybar"
load_recipe "rofi"
load_recipe "fonts"
load_recipe "ibus-skk"
load_recipe "dunst"
load_recipe "feh"
load_recipe "scrot"

# desktop applications
load_recipe "google-chrome"
load_recipe "firefox"
load_recipe "slack"
load_recipe "1password"
load_recipe "vlc"
load_recipe "obs-studio"
load_recipe "audacity"
load_recipe "libreoffice"

## restore sudo timeout
restore_sudo_timeout
