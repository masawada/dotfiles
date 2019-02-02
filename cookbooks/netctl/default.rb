package 'netctl'
package 'wpa_actiond'
package 'ifplugd'

remote_file '/etc/netctl/hooks/dhcp' do
  user 'root'
  source 'files/dhcp'
end
