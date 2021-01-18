package 'xorg-server'
package 'xorg-xinit'
package 'light'
package 'i3-wm'
yay 'i3lock-color'

dotfile '.config/i3'

%w[
  10-keyboard.conf
  50-ibm-trackpoint.conf
  50-kensington-slimblade.conf
  50-raspberry-pi-bluetooth-receiver.conf
].each do |filename|
  remote_file "/etc/X11/xorg.conf.d/#{filename}" do
    user 'root'
    mode '644'
    source "files/#{filename}"
  end
end

# > Note: you must be in the `video` group.
# https://github.com/haikarainen/light#debianubuntu
user = node[:user]
execute 'add user to video group' do
  not_if "getent group video | grep #{user}"
  command "usermod #{user} -aG video"
end
