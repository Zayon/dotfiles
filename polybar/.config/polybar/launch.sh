#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  screens=$(xrandr --query | grep " connected" | cut -d" " -f1)
  nbScreen=$(wc -l <<<"$(echo "$screens")")

  if [[ nbScreen == 1 ]]; then
    TRAY_POS=right polybar example &
  else
    primary=$(xrandr --query | grep primary | cut -d" " -f1)

    for m in $screens; do
      if [[ $primary == $m ]]; then
          traypos="right"
      else
          traypos="none"
      fi
      MONITOR=$m TRAY_POS=$traypos polybar example &
    done
  fi
else
  TRAY_POS=right polybar example &
fi
