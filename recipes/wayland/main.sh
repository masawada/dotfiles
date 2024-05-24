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
