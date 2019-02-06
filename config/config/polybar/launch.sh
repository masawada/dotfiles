#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type xrandr > /dev/null; then
  for m in $(xrandr --query | grep "\bconnected\b" | awk '{ print $1 }'); do
    MONITOR=$m polybar -q top &
  done
else
  MONITOR=eDP-1 polybar -q top &
fi
