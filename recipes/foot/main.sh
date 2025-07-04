# This recipe is Linux-only
is_linux || return

package "foot"
dotfile "config/foot/foot.ini"
