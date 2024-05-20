package "tmux"

# install tmux-xpanes
xpanes_version="4.2.0"
install_executable_file_from_url \
  "xpanes" \
  "https://raw.githubusercontent.com/greymd/tmux-xpanes/v$xpanes_version/bin/xpanes" \
  "486cb43d5670d767ce5a1bd4026262bcadb7ba153dea6f0fb2d439c82c8ad973"

dotfile "tmux.conf"
dotfile "tmux"
