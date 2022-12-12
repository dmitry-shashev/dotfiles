FilePath=(
  ".tmux.conf"
  ".zshrc"
  ".ideavimrc"
  ".config/nvim/"
  ".config/vifm/"
  ".config/i3/"
  ".config/dunst/"
  ".config/kitty/"
  ".config/sway/"
  ".xbindkeysrc"
)
ScriptsPath=$(pwd)

for Path in "${FilePath[@]}"
do
    cp -rf ~/$Path $ScriptsPath/$Path
done
