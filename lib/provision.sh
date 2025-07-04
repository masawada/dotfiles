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

## extend sudo timeout for linux
extend_sudo_timeout

## load recipes
# env RECIPE_DIR is defined in load_recipe function

# OS specific package managers
if is_macos; then
  load_recipe "homebrew"
elif is_linux; then
  load_recipe "yay"
fi

load_recipe "update"

# load ssh
load_recipe "ssh"

if pgrep ssh-agent > /dev/null; then
  ssh_agent_pid="$(pgrep ssh-agent)"
  export SSH_AGENT_PID="$ssh_agent_pid"
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

execute "ssh-add $HOME/.ssh/id_ed25519"

# basics
load_recipe "git"
load_recipe "shell"
load_recipe "vim"
load_recipe "tmux"

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
load_recipe "wayland"
load_recipe "foot"
load_recipe "skk"
load_recipe "pulseaudio"
load_recipe "fonts"
load_recipe "dunst"

# desktop applications
load_recipe "google-chrome"
load_recipe "firefox"
load_recipe "slack"
load_recipe "1password"
load_recipe "vlc"
load_recipe "obs-studio"
load_recipe "audacity"
load_recipe "libreoffice"

## restore sudo timeout for linux
restore_sudo_timeout
