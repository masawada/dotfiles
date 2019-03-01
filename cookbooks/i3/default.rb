package 'xorg-server'
package 'xorg-xinit'
package 'light'
package 'i3-wm'
package 'i3lock'

dotfile '.config/i3'

%w[
  10-keyboard.conf
  50-ibm-trackpoint.conf
  50-kensington-slimblade.conf
].each do |filename|
  remote_file "/etc/X11/xorg.conf.d/#{filename}" do
    user 'root'
    source "files/#{filename}"
  end
end
