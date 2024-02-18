eval "$($HOME/.cargo/bin/starship init zsh)"

# solve the problem - command not found: compdef
autoload -Uz compinit && compinit

local paths=(
  "$HOME/.cargo/bin"
  "$HOME/.dotnet"
  "$HOME/.dotnet/tools"
  "$HOME/.local/bin"
  "/opt/homebrew/bin/nvim"
)
export PATH=$PATH:${"${paths[*]}"// /:}
# export BROWSER='/usr/bin/google-chrome-stable'
export EDITOR='nvim'
export VISUAL='nvim'

# ensure we are not in vim mode
bindkey -e

alias vim="nvim"
alias v=nvim

alias c=clear
alias r=reset
alias e=exit

# --------------------------------------------------------
# Load config files

for conf in "$HOME/scripts/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

