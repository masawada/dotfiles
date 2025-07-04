#!/usr/bin/env bash

# Create SSH config with AddKeysToAgent setting (common for macOS and Linux)
ssh_config="$HOME/.ssh/config"
if [ ! -f "$ssh_config" ]; then
  log_info "Creating SSH config with AddKeysToAgent setting"
  create_directory "$HOME/.ssh"
  execute "chmod 700 $HOME/.ssh"
  cat > "$ssh_config" <<EOF
Host *
  AddKeysToAgent yes
EOF
  execute "chmod 600 $ssh_config"
else
  log_info "SSH config already exists. Skipping..."
fi

# Linux specific: setup ssh-agent with systemd
if is_linux; then
  dotfile "config/systemd/user/ssh-agent.service"
  dotfile "pam-environment"
  
  enable_user_systemd_service "ssh-agent"
  start_user_systemd_service "ssh-agent"
fi
