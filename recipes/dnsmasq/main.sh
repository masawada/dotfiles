# This recipe is Linux-only
is_linux || return

package "dnsmasq"

enable_systemd_service "dnsmasq"
start_systemd_service "dnsmasq"
