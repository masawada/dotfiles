dotfile "config/systemd/user/ssh-agent.service"
dotfile "pam-environment"

enable_user_systemd_service "ssh-agent"
start_user_systemd_service "ssh-agent"

execute "ssh-add $HOME/.ssh/id_ed25519"
