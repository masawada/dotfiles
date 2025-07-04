# This recipe is Linux-only
is_linux || return

package "dhclient"

system_file "etc/dhclient.conf"
