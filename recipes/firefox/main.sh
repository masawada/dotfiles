if is_macos; then
  cask "firefox"
elif is_linux; then
  package "firefox"
fi
