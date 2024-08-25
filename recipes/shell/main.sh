package "zsh"

execute_su "chsh -s $(which zsh) $(whoami)"

dotfile 'zshenv'
dotfile 'zshrc'
dotfile 'zsh'

package "less"
package "man-db"
