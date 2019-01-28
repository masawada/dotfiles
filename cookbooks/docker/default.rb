package 'docker'
package 'docker-compose'

group 'docker' do
  not_if 'getent group docker'
end

user = node[:user]
execute 'add user to docker group' do
  not_if "getent group docker | grep #{user}"
  command "usermod #{user} -aG docker"
end
