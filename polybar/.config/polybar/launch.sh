#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --query | grep " connected" | cut -d" " -f1)

if [[ $(wc -l <<<"$(echo "$screens")") == 1 ]]; then
  TRAY_POS=right polybar main &
else
  primary=$(xrandr --query | grep primary | cut -d" " -f1)

  for m in $screens; do
    if [[ $primary == $m ]]; then
        traypos="right"
        MONITOR=$m TRAY_POS=$traypos polybar main &
    else
        traypos="none"
        MONITOR=$m TRAY_POS=$traypos polybar secondary &
    fi
  done
fi
