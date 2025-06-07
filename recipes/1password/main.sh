if platform_is linux; then
  aur "1password"
elif platform_is darwin; then
  brew_cask "1password"
fi
