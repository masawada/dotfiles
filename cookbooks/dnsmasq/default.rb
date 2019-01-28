package 'dnsmasq'

service 'dnsmasq' do
  action [:enable, :start]
end
