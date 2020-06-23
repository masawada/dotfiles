package 'tlp' do
  only_if 'lsmod | grep thinkpad_acpi'
end

%w[
systemd-rfkill.service
systemd-rfkill.socket
].each do |systemd_unit|
  service systemd_unit do
    action [:stop, :disable]
    only_if 'lsmod | grep thinkpad_acpi'
  end

  execute "systemctl mask #{systemd_unit}" do
    user 'root'
    only_if 'lsmod | grep thinkpad_acpi'
  end
end

%w[
tlp.service
].each do |systemd_unit|
  service systemd_unit do
    action [:enable, :start]
    only_if 'lsmod | grep thinkpad_acpi'
  end
end
