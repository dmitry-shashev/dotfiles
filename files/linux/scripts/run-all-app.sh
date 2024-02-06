# i3-msg 'workspace 2; exec kitty tmux'
# sleep 3
# xdotool key Super+Shift+q
# xdotool key y

# chmod u+s run-all-app.sh

xbindkeys

i3-msg 'workspace 1; exec google-chrome-stable'
#sleep 3
#i3-msg 'workspace 2; exec webstorm'
#sleep 4
#i3-msg 'workspace 3; exec rider'
#sleep 4
#i3-msg 'workspace 4; exec datagrip'
sleep 4
i3-msg 'workspace 5; exec kitty tmux'
sleep 2
i3-msg 'workspace 8; exec thunderbird'
sleep 2
i3-msg 'workspace 9; exec telegram-desktop'
sleep 2
i3-msg 'workspace 10; exec slack'

xrandr --output HDMI-0 --mode 3840x2160 --rate 144

