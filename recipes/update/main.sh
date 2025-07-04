if is_macos; then
  log_info "Updating Homebrew packages..."
  execute "brew update"
  execute "brew upgrade"
  execute "brew cleanup"
elif is_linux; then
  log_info "Updating system packages..."
  execute_su "pacman -Syu --noconfirm"
  execute "yay -Syu --noconfirm --provides=no"
fi
