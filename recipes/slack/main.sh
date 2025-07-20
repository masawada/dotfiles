if is_macos; then
  cask "slack"
elif is_linux; then
  aur "slack-desktop"
fi
