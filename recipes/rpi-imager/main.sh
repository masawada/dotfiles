if is_macos; then
  cask "raspberry-pi-imager"
elif is_linux; then
  aur "rpi-imager"
fi
