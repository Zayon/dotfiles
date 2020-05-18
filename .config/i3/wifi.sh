#!/bin/bash

output=$(nmcli r wifi)

if [ $output == 'disabled' ]
then
    nmcli r wifi on
elif [ $output == 'enabled' ]
then
    nmcli r wifi off
fi
