if is_macos; then
  cask "google-chrome"
elif is_linux; then
  aur "google-chrome"
  dotfile "config/chrome-flags.conf"
fi
