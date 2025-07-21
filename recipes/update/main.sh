if is_macos; then
  log_info "Updating Homebrew packages..."
  execute "brew update"
  execute "brew upgrade"
  execute "brew cleanup"
  
  if type mas &>/dev/null; then
    log_info "Updating Mac App Store apps..."
    execute "mas upgrade"
  else
    log_info "mas not found, skipping Mac App Store updates..."
  fi
elif is_linux; then
  log_info "Updating system packages..."
  execute_su "pacman -Syu --noconfirm"
  execute "yay -Syu --noconfirm --provides=no"
fi
