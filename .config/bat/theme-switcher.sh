#!/usr/bin/env bash

VALUES=("dark" "light")
CONFIG_FILE=~/.config/bat/config
START_LINE=$(grep -n '###> theme ###' $CONFIG_FILE | cut -d':' -f1)
END_LINE=$(grep -n '###< theme ###' $CONFIG_FILE | cut -d':' -f1)

if [[ " ${VALUES[*]} " != *" $1 "* ]]; then
    echo "$1 is an invalid value"
    exit 1
fi

echo "Switching bat to $1 theme"

(( START_LINE++ ))
(( END_LINE-- ))

sed -i $CONFIG_FILE -re "${START_LINE},${END_LINE}d"
(( START_LINE-- ))

if [[ $1 == "dark" ]]; then
    sed -i "$START_LINE a --theme=\"Nord\"" $CONFIG_FILE
else
    sed -i "$START_LINE a --theme=\"ansi-light\"" $CONFIG_FILE
fi
