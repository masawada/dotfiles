# This recipe is Linux-only
if is_linux; then
  package "ntp"
  system_file "etc/ntp.conf"

  enable_systemd_service "ntpd"
  start_systemd_service "ntpd"
fi
