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
source "$LIB_DIR/platform.sh"
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

if platform_is linux; then
  load_recipe "yay"
elif platform_is darwin; then
  load_recipe "homebrew"
fi

load_recipe "update"

# load ssh-agent
load_recipe "ssh-agent"

if platform_is linux; then
  if pgrep ssh-agent > /dev/null; then
    ssh_agent_pid="$(pgrep ssh-agent)"
    export SSH_AGENT_PID="$ssh_agent_pid"
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
  fi
elif platform_is darwin; then
  # macOS handles ssh-agent differently
  if [[ -S "$SSH_AUTH_SOCK" ]]; then
    export SSH_AUTH_SOCK
  fi
fi

if [[ -f "$HOME/.ssh/id_ed25519" ]]; then
  execute "ssh-add $HOME/.ssh/id_ed25519"
fi

# basics
load_recipe "git"
load_recipe "shell"
load_recipe "vim"
load_recipe "tmux"

# tools
load_recipe "ntp"
if platform_is linux; then
  load_recipe "dhclient"
  load_recipe "netctl"
fi
load_recipe "inetutils"
if platform_is linux; then
  load_recipe "dnsmasq"
fi
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
if platform_is linux; then
  load_recipe "wayland"
  load_recipe "foot"
  load_recipe "skk"
  load_recipe "pulseaudio"
  load_recipe "dunst"
fi
load_recipe "fonts"

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
