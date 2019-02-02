include_cookbook 'functions'

expand_sudo_timeout :start

# basic
include_cookbook 'yay'
include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'ssh-agent'

# tools
include_cookbook 'dhclient'
include_cookbook 'netctl'
include_cookbook 'dnsmasq'
include_cookbook 'dnsutils'
include_cookbook 'lsof'
include_cookbook 'ghq'
include_cookbook 'peco'
include_cookbook 'docker'
include_cookbook 'jq'
include_cookbook 'tree'

# languages
include_cookbook 'perl'
include_cookbook 'ruby'
include_cookbook 'nodejs'
include_cookbook 'golang'

# desktop environments
include_cookbook 'i3'
include_cookbook 'pulseaudio'
include_cookbook 'Xresources'
include_cookbook 'xinput'
include_cookbook 'xrandr'
include_cookbook 'compton'
include_cookbook 'urxvt'
include_cookbook 'polybar'
include_cookbook 'rofi'
include_cookbook 'fonts'
include_cookbook 'ibus-skk'
include_cookbook 'dunst'
include_cookbook 'feh'

# desktop applications
include_cookbook 'google-chrome'
include_cookbook 'slack'

# laptop power management
include_cookbook 'tlp'

dotfile '.xinitrc'
dotfile '.Xmodmap'

expand_sudo_timeout :end
