#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

CONFIG_PATH=$HOME/.config/polybar/config-$(hostname)
[ ! -e $CONFIG_PATH ] && CONFIG_PATH=$HOME/.config/polybar/config

if type xrandr > /dev/null; then
  for m in $(xrandr --query | grep "\bconnected\b" | awk '{ print $1 }'); do
    MONITOR=$m polybar -q -c $CONFIG_PATH top &
  done
else
  MONITOR=eDP-1 polybar -q -c $CONFIG_PATH top &
fi
