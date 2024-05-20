package "ibus"
package "ibus-skk"
package "skk-jisyo"

config_dir="$HOME/.config/ibus-skk"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "3712ba9839838b3a00b2d3405783dc059e6c67ce033374e64f788918f400a451" \
  "$config_dir/SKK-JISYO.jawiki"

execute "dconf write /desktop/ibus/engine/skk/dictionaries \"['file=$config_dir/user.dict,mode=readwrite,type=file','file=/usr/share/skk/SKK-JISYO.L,mode=readonly,type=file','file=$config_dir/SKK-JISYO.jawiki,mode=readonly,type=file,encoding=UTF-8']\""
