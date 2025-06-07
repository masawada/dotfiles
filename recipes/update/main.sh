if platform_is linux; then
  execute_su "pacman -Syu --noconfirm"
  execute "yay -Syu --noconfirm --provides=no"
elif platform_is darwin; then
  execute "brew update"
  execute "brew upgrade"
fi
