# turn off the laptop monitor
xrandr --output eDP-1 --off

# set up the main monitor
xrandr --output DP-1 --mode 3840x2160 --rate 60 --dpi 192

# replace dpi
echo 'Xft.dpi: 192' > ~/.Xresources

# for applying DPI - sudo pkill x
