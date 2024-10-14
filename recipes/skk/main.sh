package "fcitx5-skk"
package "fcitx5-config-qt"
package "skk-jisyo"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "9ea164ad08eed516210d62635d3dfc0dd99a3976d52aa843324ff8d0baac59a9" \
  "$HOME/.local/share/fcitx5/skk/SKK-JISYO.jawiki"

dotfile "config/fcitx5/config"
dotfile "config/fcitx5/profile"
dotfile "config/fcitx5/conf/notifications.conf"
dotfile "config/fcitx5/conf/skk.conf"
dotfile "config/fcitx5/conf/waylandim.conf"
dotfile "local/share/fcitx5/skk/dictionary_list"
