package 'tlp'

%w[
systemd-rfkill.service
systemd-rfkill.socket
].each do |systemd_unit|
  service systemd_unit do
    action [:stop, :disable]
  end

  execute "systemctl mask #{systemd_unit}" do
    user 'root'
  end
end

%w[
tlp.service
tlp-sleep.service
].each do |systemd_unit|
  service systemd_unit do
    action [:enable, :start]
  end
end
