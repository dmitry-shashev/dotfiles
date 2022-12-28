i3-msg 'workspace 2; exec kitty tmux'
sleep 3
xdotool key Super+Shift+q
xdotool key y

i3-msg 'workspace 1; exec google-chrome-stable'
sleep 2
i3-msg 'workspace 3; exec kitty'
sleep 1
xdotool key t
xdotool key h
xdotool key Return
sleep 1
i3-msg 'workspace 4; exec kitty'
sleep 1
xdotool key t
xdotool key c
xdotool key Return
sleep 1
i3-msg 'workspace 8; exec thunderbird'
sleep 2
i3-msg 'workspace 9; exec telegram-desktop'
sleep 2
i3-msg 'workspace 10; exec slack'

