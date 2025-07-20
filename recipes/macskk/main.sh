#!/bin/bash

cask "mac-skk"

home_file "Library/Containers/net.mtgto.inputmethod.macSKK/Data/Library/Preferences/net.mtgto.inputmethod.macSKK.plist"

create_directory "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries"

install_file_from_url \
  "https://raw.githubusercontent.com/skk-dev/dict/master/SKK-JISYO.L" \
  "e896fc45e4185a0bc6216cf4e4be415cbc0128171d3ec42bc96c6f58f7a10f24" \
  "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L"

install_file_from_url \
  "https://raw.githubusercontent.com/tokuhirom/jawiki-kana-kanji-dict/master/SKK-JISYO.jawiki" \
  "4f2746b693604249a122af714ca99ad88aadab774457f0f302b5b274b4d60cb7" \
  "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.jawiki"

echo "macSKK installed. Please configure it in System Settings > Keyboard > Input Sources"