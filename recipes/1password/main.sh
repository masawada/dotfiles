if is_macos; then
  cask "1password"
elif is_linux; then
  aur "1password"
fi
