#!/bin/bash

# Get the current keyboard layout
CURRENT_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between layouts
if [ "$CURRENT_LAYOUT" == "ru" ]; then
    # new ubuntu version will reset layout to US if we do it vice versa
    ~/scripts/keyboard-asus.sh
    setxkbmap us
    notify-send "US" -t 400
else
    ~/scripts/keyboard-asus.sh
    setxkbmap ru
    notify-send "RU" -t 400
fi
