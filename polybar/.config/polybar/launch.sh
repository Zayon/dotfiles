#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [[ "$(xrandr --query | grep primary | cut -d" " -f1)" == $m ]]; then
        traypos="right"
    else
        traypos="none"
    fi

    MONITOR=$m TRAY_POS=$traypos polybar example &
  done
else
  TRAY_POS=right polybar example &
fi
