package "xorg-server"
package "xorg-xinit"
package "i3-wm"
aur "i3lock-color"

dotfile "config/i3"

files=(
  "etc/X11/xorg.conf.d/10-keyboard.conf"
  "etc/X11/xorg.conf.d/50-ibm-trackpoint.conf"
  "etc/X11/xorg.conf.d/50-elan-trackpoint.conf"
  "etc/X11/xorg.conf.d/50-kensington-slimblade.conf"
  "etc/X11/xorg.conf.d/50-raspberry-pi-bluetooth-receiver.conf"
)

for file in "${files[@]}"; do
  system_file "$file"
done
