package "fcitx5-skk"
package "fcitx5-config-qt"
package "skk-jisyo"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "38271b80fd34eb7244b26eba8d9d90458e0625c9c788e3b9e0da0c8ffe087167" \
  "$HOME/.local/share/fcitx5/skk/SKK-JISYO.jawiki"

dotfile "config/fcitx5/config"
dotfile "config/fcitx5/profile"
dotfile "config/fcitx5/conf/notifications.conf"
dotfile "config/fcitx5/conf/skk.conf"
dotfile "config/fcitx5/conf/waylandim.conf"
dotfile "local/share/fcitx5/skk/dictionary_list"
