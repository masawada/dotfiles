#!/usr/bin/env bash
# Common recipes for both Linux and macOS

# basics
load_recipe "git"
load_recipe "shell"
load_recipe "vim"
load_recipe "tmux"

# tools (cross-platform)
load_recipe "ghq"
load_recipe "peco"
load_recipe "docker"
load_recipe "tree"
load_recipe "whois"
load_recipe "envchain"
load_recipe "mariadb"
load_recipe "redis"
load_recipe "imagemagick"
load_recipe "ansible"
load_recipe "percona-toolkit"

# langs
load_recipe "perl"
load_recipe "ruby"
load_recipe "node"
load_recipe "go"


# desktop applications
load_recipe "google-chrome"
load_recipe "firefox"
load_recipe "slack"
load_recipe "1password"
load_recipe "vlc"
load_recipe "libreoffice"