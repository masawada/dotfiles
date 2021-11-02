package 'ntp'

remote_file '/etc/ntp.conf' do
  user 'root'
  mode '644'
  source 'files/ntp.conf'
end

service 'ntpd' do
  action [:enable, :start]
end
