package "fcitx5-skk"
package "fcitx5-config-qt"
package "skk-jisyo"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "17f538d898b59208263d118df506b1ad1da9a093be211cf077eb3f5abc71bc80" \
  "$HOME/.local/share/fcitx5/skk/SKK-JISYO.jawiki"

dotfile "config/fcitx5/config"
dotfile "config/fcitx5/profile"
dotfile "config/fcitx5/conf/notifications.conf"
dotfile "config/fcitx5/conf/skk.conf"
dotfile "config/fcitx5/conf/waylandim.conf"
dotfile "local/share/fcitx5/skk/dictionary_list"
