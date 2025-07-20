if is_macos; then
  cask "libreoffice"
elif is_linux; then
  package "libreoffice-fresh"
fi
