if is_macos; then
  cask "vlc"
elif is_linux; then
  package "vlc"
fi
