#!/usr/bin/env bash

VALUES=("dark" "light")
TERMITE_DIR=~/.config/termite/
CONFIG_FILE=${TERMITE_DIR}config
START_LINE=$(grep -n '###> colors ###' $CONFIG_FILE | cut -d':' -f1)
END_LINE=$(grep -n '###< colors ###' $CONFIG_FILE | cut -d':' -f1)

if [[ " ${VALUES[*]} " != *" $1 "* ]]; then
    echo "$1 is an invalid value"
    exit 1
fi

echo "Switching termite to $1 theme"

(( START_LINE++ ))
(( END_LINE-- ))

sed -i $CONFIG_FILE -re "${START_LINE},${END_LINE}d"
(( START_LINE-- ))
sed -i "$START_LINE r $TERMITE_DIR$1" $CONFIG_FILE

killall -USR1 termite
