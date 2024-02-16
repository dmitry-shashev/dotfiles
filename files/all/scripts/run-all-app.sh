xbindkeys

i3-msg 'workspace 1'
sleep 1
i3-msg 'exec kitty tmux & sleep 8'
sleep 8
i3-msg 'exec google-chrome-stable'
sleep 4
i3-msg 'workspace 2'
sleep 1
i3-msg 'exec webstorm'
sleep 4
i3-msg 'workspace 3'
sleep 1
i3-msg 'exec kitty tmux a -t console'
sleep 4
i3-msg 'workspace 5'
sleep 1
i3-msg 'exec kitty tmux a -t home'
sleep 2
i3-msg 'workspace 8'
sleep 1
i3-msg 'exec thunderbird'
sleep 2
i3-msg 'workspace 9'
sleep 1
i3-msg 'exec telegram-desktop'
sleep 2
i3-msg 'workspace 10'
sleep 1
i3-msg 'exec slack'

# instead "nvidia-settings"
# xrandr --output HDMI-0 --mode 3840x2160 --rate 120

# turn off emodzi - otherwise webstorm prevent using "ctrl+."
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"
gsettings set org.freedesktop.ibus.panel.emoji unicode-hotkey "[]"
