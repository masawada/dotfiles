package "zsh"

execute_su "chsh -s $(which zsh) $(whoami)"

dotfile 'zshenv'
dotfile 'zshrc'
dotfile 'zsh'
