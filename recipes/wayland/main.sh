package "hyprland"
dotfile "config/hypr/hyprland.conf"

package "waybar"

package "wofi"
dotfile "config/wofi/config"
dotfile "config/wofi/style.css"

aur "hyprshot"
create_directory "$HOME/Pictures"
