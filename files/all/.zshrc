# eval "$($HOME/.cargo/bin/starship init zsh)"
eval "$(starship init zsh)"

# ruby
# eval "$(rbenv init -)"

# solve the problem - command not found: compdef
autoload -Uz compinit && compinit

local paths=(
  "$HOME/.cargo/bin"
  "$HOME/.dotnet"
  "$HOME/.dotnet/tools"
  "$HOME/.local/bin"
  "$HOME/miniconda/bin"
  "/opt/homebrew/Caskroom/miniconda/base/bin"
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dshashev/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dshashev/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/dshashev/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dshashev/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

