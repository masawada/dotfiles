package 'dhclient'

remote_file '/etc/dhclient.conf' do
  user 'root'
  source 'files/dhclient.conf'
end
