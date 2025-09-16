#!/bin/bash

# Get the current keyboard layout
CURRENT_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between layouts
if [ "$CURRENT_LAYOUT" == "ru" ]; then
    setxkbmap us -option caps:escape
    notify-send "US" -t 400
else
    setxkbmap ru -option caps:escape
    notify-send "RU" -t 400
fi
