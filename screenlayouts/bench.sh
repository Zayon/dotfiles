#!/bin/sh
xrandr \
    --output eDP1 --off \
    --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output DP2 --off \
    --output DP3 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
    --output VIRTUAL1 --off

i3-msg restart
