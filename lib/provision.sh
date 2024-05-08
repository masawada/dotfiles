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

load_recipe "git"

## restore sudo timeout
restore_sudo_timeout
