# exports:
# - check_command
# - load_recipe
# - extend_sudo

check_command () {
  cmd="$1"

  if ! type "$cmd" > /dev/null 2>&1; then
    log_crit "command not found: $cmd"
    exit 1
  fi
}

load_recipe () {
  recipe_name="$1"
  recipe_dir="$DOT_DIR/recipes/$recipe_name"
  recipe="$recipe_dir/main.sh"

  if [ -e "$recipe" ]; then
    log_info "loading a recipe: $recipe_name"

    export RECIPE_DIR="$recipe_dir"
    # shellcheck disable=SC1090
    source "$recipe"
  else
    log_warn "recipe not found: $recipe_name"
  fi
}

extend_sudo_timeout () {
  log_info "extending sudo timeout"
  execute_su "echo \"Defaults timestamp_timeout=1800\" > /etc/sudoers.d/expand_timeout"
}

restore_sudo_timeout () {
  log_info "restoring sudo timeout"
  execute_su "rm /etc/sudoers.d/expand_timeout"
}
