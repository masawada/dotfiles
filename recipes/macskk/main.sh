#!/bin/bash

cask "macskk"

home_file "Library/Containers/net.mtgto.inputmethod.macSKK/Data/Library/Preferences/net.mtgto.inputmethod.macSKK.plist"

create_directory "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries"

install_file_from_url \
  "https://raw.githubusercontent.com/skk-dev/dict/master/SKK-JISYO.L" \
  "e896fc45e4185a0bc6216cf4e4be415cbc0128171d3ec42bc96c6f58f7a10f24" \
  "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L"

install_file_from_url \
  "https://github.com/tokuhirom/jawiki-kana-kanji-dict/releases/download/v2026.04.01.141931/SKK-JISYO.jawiki" \
  "0edd7313119547b3195588c36830ea2989f682ad44cc90f1d301b9ad7c98b53c" \
  "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.jawiki"
