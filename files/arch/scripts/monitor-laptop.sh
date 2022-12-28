# default is 96
# but for small devices better 128

# turn off the external monitor
xrandr --output DP-1 --off

# set up the main monitor
xrandr --output eDP-1 --mode 1920x1080 --rate 60 --dpi 128

# replace dpi
echo 'Xft.dpi: 128' > ~/.Xresources

# for applying DPI - sudo pkill x
