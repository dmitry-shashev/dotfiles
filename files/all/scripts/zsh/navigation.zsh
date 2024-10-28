# some more ls aliases
alias l='eza --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'
alias lt='eza --tree --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'
alias lt2='eza --tree -L 2 --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'
alias lt3='eza --tree -L 3 --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'

# find files
function ff() {
  find . -type f -iname "*$1*" ! -path '*/node_modules/*' ! -path '*/.*/*'| sed 's/ /\\ /g' | xargs -o eza --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first
}
function ffpure() {
  find ~+ -type f -iname "*$1*" ! -path '*/node_modules/*' ! -path '*/.*/*'
}

function fo() {
  find . -type f -iname "*$1*" ! -path '*/node_modules/*' ! -path '*/.*/*'| sed 's/ /\\ /g'| xargs -o nvim -p
}
# find directories
function fd() {
  find . -type d -iname "*$1*" ! -path '*/node_modules/*' ! -path '*/.*/*'| sed 's/ /\\ /g' | xargs -o eza --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first
}
function cd() {
  builtin cd "$@"
  l
}

# navigate by a part of the string
function cdp() {
  local FINAL_PATH=$({ls -ad .*/;ls -ad */} | fzf | sed "s%^%${PWD}/%g" | sed 's/ /\\ /g')
  echo $FINAL_PATH
  # check if the path is not empty
  if [ -z "${FINAL_PATH}" ]; then
    return
  fi
  builtin cd $FINAL_PATH
  l
}

