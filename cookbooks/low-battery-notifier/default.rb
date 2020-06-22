dotfile '.config/systemd/user/low-battery-notifier.timer'
dotfile '.config/systemd/user/low-battery-notifier.service'

user_service 'low-battery-notifier.timer' do
  action [:enable, :start]
  only_if "test -e /sys/class/power_supply/BAT0"
end
