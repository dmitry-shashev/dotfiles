alias gs='echo "[git status --short]" && git status --short'
alias gc='echo "[git add --all && git commit]" && git add --all && git commit'
alias gh='echo "[git checkout]" && git checkout'
alias gb='echo "[git checkout -b]" && git checkout -b'

function gl() {
  echo '[git log --graph --all --abbrev-commit --decorate]'
  git log --graph --all --abbrev-commit --decorate --reflog
}

function gbl() {
  echo '[git branch]'
  git branch
}

function gbla() {
  echo '[git branch -a]'
  git branch -a
}

function gbd() {
  echo '[git branch -D <name>]'
  git branch -D $@
}

function gblr() {
  echo '[git show-branch --remote]'
  git show-branch --remote
}

function gs() {
  echo 'git log --all -i --grep=<value>'
  git log --all -i --grep="$@"
}

function grh() {
  echo "[git reset --hard]"
  git reset --hard
  echo "[git clean -fd]"
  git clean -fd
}
function gd () {
  preview="git diff $@ --color=always --staged --no-prefix -U1000 -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

#open changed files
function go() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  git status --porcelain | grep -v "[/]$" | grep -v "^\s*D" | sed s%...%% | sed "s%^%${REPO_PATH}/%g" | sed 's/ /\\ /g' | xargs -o nvim -p
}

function greview() {
  local MAIN_BRANCH=$1
  local TARGET_BRANCH=$2

  # forbid if there any changes
  local CURRENT_CHANGES=$(git status --short)
  if [ ! -z "${CURRENT_CHANGES}" ]; then
    echo "Error: changes found"
    return
  fi

  # prepare the target branch
  git checkout $MAIN_BRANCH
  git branch -D $TARGET_BRANCH
  git fetch origin $TARGET_BRANCH
  git checkout $TARGET_BRANCH

  # reset to the root branch commit
  local FIRST_BRANCH_COMMIT=$(git rev-list --first-parent $TARGET_BRANCH ^$MAIN_BRANCH | tail -1)
  local ROOT_COMMIT=$(git rev-parse $FIRST_BRANCH_COMMIT^)
  git reset $ROOT_COMMIT

  echo "Branch [$TARGET_BRANCH] has been prepared for review"
}

# navigate to the git root
function cdg() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  cd $REPO_PATH
}

function gw() {
  echo '[git worktree <command>]'
  git worktree $@
}

function gwl() {
  echo '[git worktree list]'
  git worktree list
}

function gwa() {
  echo '[git worktree add <name>]'
  git worktree add $@
}

function gwr() {
  echo '[git worktree remove <name>]'
  git worktree remove $@
}
