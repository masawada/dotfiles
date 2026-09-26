if is_macos; then
  cask "1password"
  package "1password-cli"
elif is_linux; then
  aur "1password"
  aur "1password-cli"
fi
