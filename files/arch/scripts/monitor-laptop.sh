# turn off the external monitor
xrandr --output DP-1 --off

# set up the main monitor
xrandr --output eDP-1 --mode 1920x1080 --rate 60

# replace dpi
echo 'Xft.dpi: 96' > ~/.Xresources

# for applying DPI - sudo pkill x
