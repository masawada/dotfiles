package "git"
package "hub"

if is_macos; then
  package "gh"
elif is_linux; then
  package "github-cli"
fi

dotfile "gitignore"
dotfile "gitconfig"
