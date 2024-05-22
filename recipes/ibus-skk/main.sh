package "ibus"
package "ibus-skk"
package "skk-jisyo"

config_dir="$HOME/.config/ibus-skk"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "38271b80fd34eb7244b26eba8d9d90458e0625c9c788e3b9e0da0c8ffe087167" \
  "$config_dir/SKK-JISYO.jawiki"

execute "dconf write /desktop/ibus/engine/skk/dictionaries \"['file=$config_dir/user.dict,mode=readwrite,type=file','file=/usr/share/skk/SKK-JISYO.L,mode=readonly,type=file','file=$config_dir/SKK-JISYO.jawiki,mode=readonly,type=file,encoding=UTF-8']\""
