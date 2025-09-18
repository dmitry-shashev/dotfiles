rm ~/.Xmodmap
cp ~/scripts/keyboard-layouts/.Xmodmap_asus ~/.Xmodmap
xmodmap ~/.Xmodmap
xmodmap -e "remove lock = Escape"
xmodmap -e "add lock = Caps_Lock"
