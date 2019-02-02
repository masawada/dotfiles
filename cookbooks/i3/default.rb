package 'xorg-server'
package 'xorg-xinit'
package 'light'
package 'i3-wm'
package 'i3lock'

dotfile '.config/i3'

remote_file '/etc/X11/xorg.conf.d/10-keyboard.conf' do
  user 'root'
  source 'files/10-keyboard.conf'
end
