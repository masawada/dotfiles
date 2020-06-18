package 'netctl'
package 'ifplugd'

remote_file '/etc/netctl/hooks/dhcp' do
  mode '755'
  user 'root'
  source 'files/dhcp'
end
