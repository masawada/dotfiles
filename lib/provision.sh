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

# Setup SSH agent environment for Linux
if is_linux && pgrep ssh-agent > /dev/null; then
  export SSH_AGENT_PID="$(pgrep ssh-agent)"
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

# Add SSH key
[ -f "$HOME/.ssh/id_ed25519" ] && execute "ssh-add $HOME/.ssh/id_ed25519"

# Load common recipes
source "$LIB_DIR/provision/common.sh"

# Load platform-specific recipes
if is_macos; then
  source "$LIB_DIR/provision/macos.sh"
elif is_linux; then
  source "$LIB_DIR/provision/linux.sh"
fi

## restore sudo timeout for linux
restore_sudo_timeout
