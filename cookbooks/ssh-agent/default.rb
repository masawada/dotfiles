dotfile '.config/systemd/user/ssh-agent.service'
dotfile '.pam-environment'

user_service 'ssh-agent' do
  action [:enable, :start]
end
