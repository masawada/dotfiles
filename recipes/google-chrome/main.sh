if platform_is linux; then
  aur "google-chrome"
  dotfile "config/chrome-flags.conf"
elif platform_is darwin; then
  brew_cask "google-chrome"
fi
