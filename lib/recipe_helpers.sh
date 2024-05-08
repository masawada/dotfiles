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
  log_info "installing a dotfile: $1"

  real_path="$CONFIG_DIR/$1"
  symlink_path="$HOME/.$1"

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
  log_info "installing a file: $1"

  source_path="$RECIPE_DIR/files/$1"
  destination_path="/$1"

  if [ -d "$(dirname "$destination_path")" ]; then
    execute_su "mkdir -p $(dirname "$destination_path")"
  fi

  if [ ! -e "$destination_path" ]; then
    execute_su "cp $source_path $destination_path"
  else
    log_info "$destination_path already exists. Skipping..."
  fi
}
