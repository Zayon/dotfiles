#!/usr/bin/env sh

if [[ $(pactl list modules | grep module-loopback | wc -l) == 1 ]]; then
    pactl unload-module module-loopback
else
    pactl load-module module-loopback latency_msec=1
fi
