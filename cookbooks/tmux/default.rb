package 'tmux'

case node[:platform]
when 'arch'
  package 'xsel'
when 'darwin'
  package 'reattach-to-user-namespace'
end

execute 'fetch tmux-xpanes' do
  command 'curl -fSL -o /tmp/xpanes https://raw.githubusercontent.com/greymd/tmux-xpanes/master/bin/xpanes'
  user node[:user]
  not_if 'test -f /usr/local/bin/xpanes'
end
execute 'install tmux-xpanes' do
  command 'mv /tmp/xpanes /usr/local/bin/xpanes && chmod 0755 /usr/local/bin/xpanes'
  not_if 'test -f /usr/local/bin/xpanes'
end

dotfile '.tmux.conf'
dotfile '.tmux'
