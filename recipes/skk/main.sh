package "fcitx5-skk"
package "fcitx5-config-qt"
package "skk-jisyo"

install_file_from_url \
  "https://github.com/tokuhirom/jawiki-kana-kanji-dict/releases/download/v2026.04.01.141931/SKK-JISYO.jawiki" \
  "0edd7313119547b3195588c36830ea2989f682ad44cc90f1d301b9ad7c98b53c" \
  "$HOME/.local/share/fcitx5/skk/SKK-JISYO.jawiki"

dotfile "config/fcitx5/config"
dotfile "config/fcitx5/profile"
dotfile "config/fcitx5/conf/notifications.conf"
dotfile "config/fcitx5/conf/skk.conf"
dotfile "config/fcitx5/conf/waylandim.conf"
dotfile "local/share/fcitx5/skk/dictionary_list"
