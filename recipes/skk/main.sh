package "fcitx5-skk"
package "fcitx5-config-qt"
package "skk-jisyo"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "6fd84f6268af3c5863c50c83bb09a1fd23dea97bbbbfd1b7193e2c63f6887487" \
  "$HOME/.local/share/fcitx5/skk/SKK-JISYO.jawiki"

dotfile "config/fcitx5/config"
dotfile "config/fcitx5/profile"
dotfile "config/fcitx5/conf/notifications.conf"
dotfile "config/fcitx5/conf/skk.conf"
dotfile "config/fcitx5/conf/waylandim.conf"
dotfile "local/share/fcitx5/skk/dictionary_list"
