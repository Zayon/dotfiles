#!/bin/bash

if [ -z "$1" ]; then
    echo "You need to provide a file as argument"
    exit 1
fi

WALLPAPER=$HOME/wallpaper.png

if [ ! -f $1 ]; then
    echo "File $1 not found!"
    exit 1
fi

convert $1 $WALLPAPER
feh --bg-fill $WALLPAPER
