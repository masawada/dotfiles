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

install_binary_archived_with_tarball () {
  name="$1"
  url="$2"
  extracted_dir="$3"
  sha256_checksum="$4"

  log_info "installing a binary archived with tarball: $name"
  execute "curl -L $url -o /tmp/$name.tar.gz"
  execute "echo \"$sha256_checksum  /tmp/$name.tar.gz\" | sha256sum -c"
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
  execute "echo \"$sha256_checksum  /tmp/$name.zip\" | sha256sum -c"
  execute "unzip -o /tmp/$name.zip -d /tmp"
  execute_su "install /tmp/$extracted_dir/$name /usr/local/bin/$name"
}

install_executable_file_from_url () {
  name="$1"
  url="$2"
  sha256_checksum="$3"

  log_info "installing an executable file from URL: $name"
  execute "curl -L $url -o /tmp/$name"
  execute "echo \"$sha256_checksum  /tmp/$name\" | sha256sum -c"
  execute_su "install /tmp/$name /usr/local/bin/$name"
}

create_directory () {
  directory_path="$1"

  log_info "creating a directory: $directory_path"

  if [ ! -d "$directory_path" ]; then
    execute_su "mkdir -p $directory_path"
  else
    log_info "$directory_path already exists. Skipping..."
  fi
}

create_symlnk () {
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

# copy $RECIPE_DIR/files/$1 to /$1 if not exists
system_file () {
  source_path="$RECIPE_DIR/files/$1"
  destination_path="/$1"

  log_info "installing a file: $destination_path"

  create_directory "$(dirname "$destination_path")"

  if [ ! -e "$destination_path" ]; then
    execute_su "cp $source_path $destination_path"
  else
    log_info "$destination_path already exists. Skipping..."
  fi
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
