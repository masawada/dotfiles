package () {
  package_name="$1"

  log_info "installing a package: $package_name"

  if is_macos; then
    # macOS: use Homebrew
    if ! brew list "$package_name" &>/dev/null; then
      execute "brew install $package_name"
    else
      log_info "$package_name is already installed. Skipping..."
    fi
  elif is_linux; then
    # Linux: use pacman
    if ! pacman -Q "$package_name" &>/dev/null; then
      execute_su "pacman -S --noconfirm $package_name"
    else
      log_info "$package_name is already installed. Skipping..."
    fi
  else
    log_warn "Unsupported OS. Cannot install package: $package_name"
  fi
}

mac_app_store () {
  app_id="$1"
  app_name="${2:-$app_id}"

  if is_linux; then
    log_warn "Mac App Store is not available on Linux. Skipping: $app_name"
    return 0
  fi

  log_info "installing Mac App Store app: $app_name (ID: $app_id)"

  if ! mas list | grep -q "^$app_id"; then
    execute "mas install $app_id"
  else
    log_info "$app_name is already installed. Skipping..."
  fi
}

aur () {
  package_name="$1"

  if is_macos; then
    log_warn "AUR is not available on macOS. Skipping: $package_name"
    return 0
  fi

  log_info "installing a package from AUR: $package_name"

  if ! yay -Q "$package_name" &>/dev/null; then
    execute "yay -S --noconfirm --provides=no $package_name"
  else
    log_info "$package_name is already installed. Skipping..."
  fi
}

cask () {
  cask_name="$1"

  if is_linux; then
    log_warn "Homebrew Cask is not available on Linux. Skipping: $cask_name"
    return 0
  fi

  log_info "installing a cask: $cask_name"

  if ! brew list --cask "$cask_name" &>/dev/null; then
    execute "brew install --cask $cask_name"
  else
    log_info "$cask_name is already installed. Skipping..."
  fi
}

install_binary_archived_with_tarball () {
  name="$1"
  url="$2"
  extracted_dir="$3"
  sha256_checksum="$4"

  log_info "installing a binary archived with tarball: $name"
  execute "curl -L $url -o /tmp/$name.tar.gz"
  if is_macos; then
    execute "echo \"$sha256_checksum  /tmp/$name.tar.gz\" | shasum -a 256 -c"
  else
    execute "echo \"$sha256_checksum  /tmp/$name.tar.gz\" | sha256sum -c"
  fi
  execute "tar --overwrite -xzf /tmp/$name.tar.gz -C /tmp"
  execute_su "install /tmp/$extracted_dir/$name /usr/local/bin/$name"
}

install_binary_archived_with_zip () {
  name="$1"
  url="$2"
  extracted_dir="$3"
  sha256_checksum="$4"

  log_info "installing a binary archived with zip: $name"
  execute "curl -L $url -o /tmp/$name.zip"
  if is_macos; then
    execute "echo \"$sha256_checksum  /tmp/$name.zip\" | shasum -a 256 -c"
  else
    execute "echo \"$sha256_checksum  /tmp/$name.zip\" | sha256sum -c"
  fi
  execute "unzip -o /tmp/$name.zip -d /tmp"
  execute_su "install /tmp/$extracted_dir/$name /usr/local/bin/$name"
}

install_executable_file_from_url () {
  name="$1"
  url="$2"
  sha256_checksum="$3"

  log_info "installing an executable file from URL: $name"
  execute "curl -L $url -o /tmp/$name"
  if is_macos; then
    execute "echo \"$sha256_checksum  /tmp/$name\" | shasum -a 256 -c"
  else
    execute "echo \"$sha256_checksum  /tmp/$name\" | sha256sum -c"
  fi
  
  # Ensure /usr/local/bin exists before installing
  if [ ! -d "/usr/local/bin" ]; then
    log_info "Creating /usr/local/bin directory..."
    execute_su "mkdir -p /usr/local/bin"
  fi
  
  execute_su "install /tmp/$name /usr/local/bin/$name"
}

install_file_from_url () {
  url="$1"
  sha256_checksum="$2"
  destination_path="$3"

  create_directory "$(dirname "$destination_path")"

  log_info "installing a file from URL: $destination_path"
  execute "curl -L $url -o /tmp/$(basename "$destination_path")"
  if is_macos; then
    execute "echo \"$sha256_checksum  /tmp/$(basename "$destination_path")\" | shasum -a 256 -c"
  else
    execute "echo \"$sha256_checksum  /tmp/$(basename "$destination_path")\" | sha256sum -c"
  fi
  execute "cp /tmp/$(basename "$destination_path") $destination_path"
}

create_directory () {
  directory_path="$1"

  log_info "creating a directory: $directory_path"

  if [ ! -d "$directory_path" ]; then
    execute "mkdir -p $directory_path"
  else
    log_info "$directory_path already exists. Skipping..."
  fi
}

create_directory_su () {
  directory_path="$1"

  log_info "creating a directory: $directory_path"

  if [ ! -d "$directory_path" ]; then
    execute_su "mkdir -p $directory_path"
  else
    log_info "$directory_path already exists. Skipping..."
  fi
}

create_symlink () {
  source_path="$1"
  destination_path="$2"

  log_info "creating a symlink: $destination_path -> $source_path"

  if [ ! -e "$destination_path" ]; then
    execute_su "ln -s $source_path $destination_path"
  else
    log_info "$destination_path already exists. Skipping..."
  fi
}

# create symlink $CONFIG_DIR/$1 to $HOME/.$1 if not exists
dotfile () {
  real_path="$CONFIG_DIR/$1"
  symlink_path="$HOME/.$1"

  log_info "installing a dotfile: $symlink_path"

  create_directory "$(dirname "$symlink_path")"

  if [ ! -e "$symlink_path" ]; then
    execute "ln -s $real_path $symlink_path"
  else
    log_info "$symlink_path already exists. Skipping..."
  fi
}

# copy $RECIPE_DIR/files/$1 to /$1
system_file () {
  source_path="$RECIPE_DIR/files/$1"
  destination_path="/$1"

  log_info "installing a file: $destination_path"

  create_directory_su "$(dirname "$destination_path")"
  execute_su "cp $source_path $destination_path"
}

# copy $RECIPE_DIR/files/$1 to $HOME/$1
home_file () {
  source_path="$RECIPE_DIR/files/$1"
  destination_path="$HOME/$1"

  log_info "installing a file: $destination_path"

  create_directory "$(dirname "$destination_path")"
  execute "cp $source_path $destination_path"
}

# enable service with systemd if not enabled
enable_systemd_service () {
  log_info "enabling a systemd service: $1"

  service_name="$1"

  if ! systemctl is-enabled --quiet "$service_name"; then
    execute_su "systemctl enable $service_name"
  else
    log_info "$service_name is already enabled. Skipping..."
  fi
}

# start service with systemd if not started
start_systemd_service () {
  log_info "starting a systemd service: $1"

  service_name="$1"

  if ! systemctl is-active --quiet "$service_name"; then
    execute_su "systemctl enable --now $service_name"
  else
    log_info "$service_name is already started. Skipping..."
  fi
}

# enable user service with systemd if not enabled
enable_user_systemd_service () {
  log_info "enabling a user systemd service: $1"

  service_name="$1"

  if ! systemctl --user is-enabled --quiet "$service_name"; then
    execute "systemctl --user enable $service_name"
  else
    log_info "$service_name is already enabled. Skipping..."
  fi
}

# start user service with systemd if not started
start_user_systemd_service () {
  log_info "starting a user systemd service: $1"

  service_name="$1"

  if ! systemctl --user is-active --quiet "$service_name"; then
    execute "systemctl --user enable --now $service_name"
  else
    log_info "$service_name is already started. Skipping..."
  fi
}

# create a group if not exists
group () {
  group_name="$1"

  log_info "creating a group: $group_name"

  if ! getent group "$group_name" &>/dev/null; then
    execute_su "groupadd $group_name"
  else
    log_info "$group_name already exists. Skipping..."
  fi
}

# add user to a group if not added
add_user_to_group () {
  user_name="$1"
  group_name="$2"

  log_info "adding a user to a group: $user_name -> $group_name"

  if ! getent group "$group_name" | grep -q "\b$user_name\b"; then
    execute_su "usermod -aG $group_name $user_name"
  else
    log_info "$user_name is already in $group_name. Skipping..."
  fi
}
