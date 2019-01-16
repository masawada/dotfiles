package 'tmux'

case node[:platform]
when 'arch'
  package 'xsel'
when 'darwin'
  package 'reattach-to-user-namespace'
end

dotfile '.tmux.conf'
dotfile '.tmux'
