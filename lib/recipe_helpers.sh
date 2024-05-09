package () {
  package_name="$1"

  log_info "installing a package: $package_name"

  if ! pacman -Q "$package_name" &>/dev/null; then
    execute_su "pacman -S --noconfirm $package_name"
  else
    log_info "$package_name is already installed. Skipping..."
  fi
}

aur () {
  package_name="$1"

  log_info "installing a package from AUR: $package_name"

  if ! yay -Q "$package_name" &>/dev/null; then
    execute "yay -S --noconfirm --provides=no $package_name"
  else
    log_info "$package_name is already installed. Skipping..."
  fi
}

install_binary_with_tarball () {
  name="$1"
  url="$2"
  extracted_dir="$3"
  sha256_checksum="$4"

  log_info "installing a binary archived with tarball: $name"
  execute "curl -L $url -o /tmp/$name.tar.gz"
  execute "echo \"$sha256_checksum  /tmp/$name.tar.gz\" | sha256sum -c"
  execute "tar -xzf /tmp/$name.tar.gz -C /tmp"
  execute_su "install /tmp/$extracted_dir/$name /usr/local/bin/$name"
}

install_binary_with_zip () {
  name="$1"
  url="$2"
  extracted_dir="$3"
  sha256_checksum="$4"

  log_info "installing a binary archived with zip: $name"
  execute "curl -L $url -o /tmp/$name.zip"
  execute "echo \"$sha256_checksum  /tmp/$name.zip\" | sha256sum -c"
  execute "unzip /tmp/$name.zip -d /tmp"
  execute_su "install /tmp/$extracted_dir/$name /usr/local/bin/$name"
}

# create symlink $CONFIG_DIR/$1 to $HOME/.$1 if not exists
dotfile () {
  real_path="$CONFIG_DIR/$1"
  symlink_path="$HOME/.$1"

  log_info "installing a dotfile: $symlink_path"

  if [ ! -d "$(dirname "$symlink_path")" ]; then
    execute "mkdir -p $(dirname "$symlink_path")"
  fi

  if [ ! -e "$symlink_path" ]; then
    execute "ln -s $real_path $symlink_path"
  else
    log_info "$symlink_path already exists. Skipping..."
  fi
}

# copy $RECIPE_DIR/files/$1 to /$1 if not exists
system_file () {
  source_path="$RECIPE_DIR/files/$1"
  destination_path="/$1"

  log_info "installing a file: $destination_path"

  if [ ! -d "$(dirname "$destination_path")" ]; then
    execute_su "mkdir -p $(dirname "$destination_path")"
  fi

  if [ ! -e "$destination_path" ]; then
    execute_su "cp $source_path $destination_path"
  else
    log_info "$destination_path already exists. Skipping..."
  fi
}

# enable service with systemd if not enabled
enable_systemd_service () {
  log_info "installing a systemd service: $1"

  service_name="$1"

  if ! systemctl is-enabled --quiet "$service_name"; then
    execute_su "systemctl enable $service_name"
  else
    log_info "$service_name is already enabled. Skipping..."
  fi
}

# start service with systemd if not started
start_systemd_service () {
  log_info "installing a systemd service: $1"

  service_name="$1"

  if ! systemctl is-active --quiet "$service_name"; then
    execute_su "systemctl enable --now $service_name"
  else
    log_info "$service_name is already started. Skipping..."
  fi
}

# enable user service with systemd if not enabled
enable_user_systemd_service () {
  log_info "installing a user systemd service: $1"

  service_name="$1"

  if ! systemctl --user is-enabled --quiet "$service_name"; then
    execute "systemctl --user enable $service_name"
  else
    log_info "$service_name is already enabled. Skipping..."
  fi
}

# start user service with systemd if not started
start_user_systemd_service () {
  log_info "installing a user systemd service: $1"

  service_name="$1"

  if ! systemctl --user is-active --quiet "$service_name"; then
    execute "systemctl --user enable --now $service_name"
  else
    log_info "$service_name is already started. Skipping..."
  fi
}
