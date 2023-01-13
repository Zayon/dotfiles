#!/usr/bin/env sh

if [[ $(pactl list modules | grep module-loopback | wc -l) == 1 ]]; then
    echo ""
else
    echo ""
fi
