package "hyprland"
dotfile "config/hypr/hyprland.conf"

package "hyprlock"
dotfile "config/hypr/hyprlock.conf"

package "waybar"

package "wofi"
dotfile "config/wofi/config"
dotfile "config/wofi/style.css"

aur "hyprshot"
create_directory "$HOME/Pictures"

aur "wlogout"
dotfile "config/wlogout/layout"

# configure mouse button
system_file "etc/udev/hwdb.d/70-raspberry-pi-bluetooth-receiver.hwdb"
execute_su "systemd-hwdb update"
execute_su "udevadm trigger"

aur "xremap-hypr-bin"
dotfile "config/xremap/config.yml"
add_user_to_group "$USER" "input"
system_file "etc/modules-load.d/uinput.conf"
system_file "etc/udev/rules.d/99-input.rules"
