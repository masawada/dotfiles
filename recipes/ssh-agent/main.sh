dotfile "config/systemd/user/ssh-agent.service"
dotfile "pam-environment"

enable_user_systemd_service "ssh-agent"
start_user_systemd_service "ssh-agent"

if pgrep ssh-agent > /dev/null; then
  ssh_agent_pid="$(pgrep ssh-agent)"
  export SSH_AGENT_PID="$ssh_agent_pid"
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

execute "ssh-add $HOME/.ssh/id_ed25519"
