package "docker"
package "docker-compose"

group "docker"
add_user_to_group "$USER" "docker"

enable_systemd_service "docker"
start_systemd_service "docker"
