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
include_cookbook 'ghq'
include_cookbook 'peco'
include_cookbook 'docker'

# languages
include_cookbook 'perl'
include_cookbook 'ruby'
include_cookbook 'nodejs'
include_cookbook 'golang'

# desktop environments
include_cookbook 'i3'
include_cookbook 'Xresources'
include_cookbook 'urxvt'
include_cookbook 'polybar'
include_cookbook 'rofi'
include_cookbook 'fonts'
include_cookbook 'ibus-skk'
include_cookbook 'netctl'
include_cookbook 'dunst'

# desktop applications
include_cookbook 'google-chrome'
include_cookbook 'slack'

dotfile '.xinitrc'

expand_sudo_timeout :end
