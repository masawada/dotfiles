package "ntp"
system_file "etc/ntp.conf"

enable_systemd_service "ntpd"
start_systemd_service "ntpd"
