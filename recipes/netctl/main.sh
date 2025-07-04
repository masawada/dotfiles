# This recipe is Linux-only
is_linux || return

package "netctl"
package "ifplugd"

system_file "etc/netctl/hooks/dhcp"
execute_su "chmod 755 /etc/netctl/hooks/dhcp"
