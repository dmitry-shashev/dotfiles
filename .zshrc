eval "$(starship init zsh)"

# solve the problem - command not found: compdef
autoload -Uz compinit && compinit

# use new curl instead of the default one
export PATH="/opt/homebrew/opt/curl/bin:$PATH:/home/picnic/.cargo/bin:/home/picnic/.dotnet:/home/picnic/.dotnet/tools"

# --------------------------------------------------------

# some more ls aliases
alias l='exa --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'
alias lt='exa --tree --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'
alias lt2='exa --tree -L 2 --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'
alias lt3='exa --tree -L 3 --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first'

# dotnet
alias d=dotnet

# tmux sessions
export TMUX_TMPDIR=$HOME/.tmux-temp
alias th='tmux source-file ~/.tmux.conf && tmux a -t home'
alias tc='tmux source-file ~/.tmux.conf && tmux a -t consoles'
alias t='tmux'

# chrome in debug mode
alias cc='sudo /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'

export EDITOR='nvim'
export VISUAL='nvim'
alias vim="nvim"
# But still use emacs-style zsh bindings
bindkey -e

alias c=clear
alias r=reset
alias e=exit
fl() {
  echo "-------> [$(pwd)]"
  echo ""
  # ls --group-directories-first -la
  gls -Flh --group-directories-first
}
# docker
alias dc=docker-compose
alias dc@stop='docker stop $(docker ps -a -q)'
# vim
alias v=nvim
alias vg=$'nvim -p $(git status -s | awk \'{print $2}\')'
# git
alias gs='echo "[git status --short]" && git status --short'
alias ga='echo "[git add --all]" && git add --all'
alias gc='echo "[git add --all && git commit]" && git add --all && git commit'
alias gl='echo "[git log --graph --abbrev-commit --decorate]" && git log --graph --abbrev-commit --decorate'
alias gh='echo "[git checkout]" && git checkout'
alias gb='echo "[git checkout -b]" && git checkout -b'
alias gbl='echo "[git branch]" && git branch'
alias gbd='echo "[git branch -D]" && git branch -D'
alias gpm='echo "[git push origin master]" && git push origin master'

function grh() {
  echo "[git reset --hard]"
  git reset --hard
  echo "[git clean -fd]"
  git clean -fd
}
function gf () {
  preview="git diff $@ --color=always --staged --no-prefix -U1000 -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# --------------------------------------------------------
function p() {
  pnpm $@
}
function px() {
  pnpx $@
}
function y() {
  yarn $@
}
function yx() {
  yarn create $@
}

# find files
function ff() {
  find . -type f -iname "*$1*"|grep -v ".git"| sed 's/ /\\ /g' | xargs -o exa --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first
}
# find directories
function fd() {
  find . -type d -iname "*$1*"|grep -v ".git"| sed 's/ /\\ /g' | xargs -o exa --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first
}
# find and open files
function ffo() {
  find . -type f -iname "*$1*"|grep -v ".git"| sed 's/ /\\ /g' | xargs -o nvim -p
}
# find changed files
function lg() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  git status --porcelain | grep -v "D" | sed s%...%% | sed "s%^%${REPO_PATH}/%g" | sed 's/ /\\ /g' | xargs -o exa --long --icons --all --git --octal-permissions --no-permissions --time-style=long-iso --group-directories-first
}
# find and open changed files
function lgo() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  git status --porcelain | grep -v "D" | sed s%...%% | sed "s%^%${REPO_PATH}/%g" | sed 's/ /\\ /g' | xargs -o nvim -p
}
function cd() {
  builtin cd "$@"
  l
}
# navigate to the git root
function cdg() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  cd $REPO_PATH
}
# navigate by a part of the string
function cf() {
  local FINAL_PATH=$(ls -ad */ | fzf | sed "s%^%${PWD}/%g" | sed 's/ /\\ /g')
  builtin cd $FINAL_PATH
  l
}

#-------------------------------------------------------

function vl() {
  cd ~/lib
  v
}

function vb() {
  cd ~/domains/lf-backend
  v
}

function vf() {
  cd ~/domains/lost-and-found
  v
}

function vw() {
  cd ~/domains/Winter
  v
}

function vm() {
  cd ~/domains/mono-graph
  v
}

function vh() {
  cd ~/domains/hospitality-solutions
  v
}

