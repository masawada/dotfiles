package "zsh"

# Change default shell
execute_su "chsh -s $(which zsh) $(whoami)"

dotfile 'zshenv'
dotfile 'zshrc'
dotfile 'zsh'

# Less and man packages (less is pre-installed on macOS)
if is_linux; then
  package "less"
  package "man-db"
fi
