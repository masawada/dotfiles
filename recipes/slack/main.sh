if platform_is linux; then
  aur "slack-desktop"
elif platform_is darwin; then
  brew_cask "slack"
fi
