# This recipe is Linux-only
is_linux || return

package "dunst"

dotfile "config/dunst"
