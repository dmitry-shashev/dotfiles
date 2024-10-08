eval "$($HOME/.cargo/bin/starship init zsh)"

# ruby
# eval "$(rbenv init -)"

# solve the problem - command not found: compdef
autoload -Uz compinit && compinit

local paths=(
  "$HOME/.cargo/bin"
  "$HOME/.dotnet"
  "$HOME/.dotnet/tools"
  "$HOME/.local/bin"
  "/opt/homebrew/bin"
)
export PATH=$PATH:${"${paths[*]}"// /:}
# export BROWSER='/usr/bin/google-chrome-stable'
export EDITOR='nvim'
export VISUAL='nvim'

if [[ `uname` == Linux ]] then
    find $HOME/.ssh-keys -type f -iname "id_rsa" | xargs -o /usr/bin/keychain &> /dev/null
    source $HOME/.keychain/$HOST-sh
fi

# ensure we are not in vim mode
bindkey -e

alias vim="nvim"
alias v=nvim

alias c=clear
alias r=reset
alias e=exit

# --------------------------------------------------------
# Highlight completion

zstyle ":completion:*" menu select
zstyle ":completion:*" group-name ''

# --------------------------------------------------------
# Load config files

for conf in "$HOME/scripts/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

# --------------------------------------------------------
# Tmux auto-closing setup

alias tmuxn='tmux new-session -s $$'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT
