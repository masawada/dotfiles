package 'zsh'

execute "chsh -s $(which zsh) #{node[:user]}" do
  user 'root'
end

dotfile '.zshenv'
dotfile '.zshrc'
dotfile '.zsh'
