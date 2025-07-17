#!/usr/bin/env bash
# Linux-specific recipes

# tools (Linux-only)
load_recipe "ntp"
load_recipe "dhclient"
load_recipe "netctl"
load_recipe "inetutils"
load_recipe "dnsmasq"
load_recipe "dnsutils"
load_recipe "lsof"
load_recipe "clipboard"
load_recipe "gnome-keyring"

# desktop environments (Linux-only)
load_recipe "wayland"
load_recipe "foot"
load_recipe "pulseaudio"
load_recipe "dunst"