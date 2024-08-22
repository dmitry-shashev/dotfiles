function printCommand() {
  # Black: 30
  # Red: 31
  # Green: 32
  # Yellow: 33
  # Blue: 34
  # Magenta: 35
  # Cyan: 36
  # White: 37
  local FG_COLOR='\033[0;37m'

  # Black: 40
  # Red: 41
  # Green: 42
  # Yellow: 43
  # Blue: 44
  # Magenta: 45
  # Cyan: 46
  # White: 47
  local BG_COLOR='\033[46m'

  local RESET_COLOR='\033[0m'
  echo $FG_COLOR$BG_COLOR$@$RESET_COLOR
}

function gch() {
  git checkout
  printCommand "[git checkout]"
}

function gc() {
  git add --all && git commit
  printCommand "[git add --all && git commit]"
}

function gb() {
  git checkout -b $@
  printCommand "[git checkout -b]"
}

function gchm() {
  local DEFAULT_BRANCH_NAME=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  git checkout $DEFAULT_BRANCH_NAME
  printCommand "[git checkout $DEFAULT_BRANCH_NAME]"
}

function gsync() {
  local DEFAULT_BRANCH_NAME=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  git checkout $DEFAULT_BRANCH_NAME
  printCommand "[git checkout $DEFAULT_BRANCH_NAME]"
  git pull origin $DEFAULT_BRANCH_NAME
  printCommand "[git pull origin $DEFAULT_BRANCH_NAME]"
}

function gmerge() {
  local DEFAULT_BRANCH_NAME=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  local CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  git checkout $DEFAULT_BRANCH_NAME
  printCommand "[git checkout $DEFAULT_BRANCH_NAME]"
  git pull origin $DEFAULT_BRANCH_NAME
  printCommand "[git pull origin $DEFAULT_BRANCH_NAME]"
  git checkout $CURRENT_BRANCH_NAME
  printCommand "[git checkout $CURRENT_BRANCH_NAME]"
  git merge $DEFAULT_BRANCH_NAME
  printCommand "[git merge $DEFAULT_BRANCH_NAME]"
}

function grebase() {
  local DEFAULT_BRANCH_NAME=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  local CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  git checkout $DEFAULT_BRANCH_NAME
  printCommand "[git checkout $DEFAULT_BRANCH_NAME]"
  git pull origin $DEFAULT_BRANCH_NAME
  printCommand "[git pull origin $DEFAULT_BRANCH_NAME]"
  git checkout $CURRENT_BRANCH_NAME
  printCommand "[git checkout $CURRENT_BRANCH_NAME]"
  git rebase $DEFAULT_BRANCH_NAME
  printCommand "[git rebase $DEFAULT_BRANCH_NAME]"
}

function gpush() {
  local CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  git push origin $CURRENT_BRANCH_NAME
  printCommand "[git push origin $CURRENT_BRANCH_NAME]"
}

function gs() {
  git status --short
  printCommand '[git status --short]'
  echo "[\"$(git log -1 --format=%h)\"] $(git log -1 --format="%s")"
}

function gl() {
  git log --graph --all --abbrev-commit --decorate --reflog
  printCommand '[git log --graph --all --abbrev-commit --decorate]'
}

function gbl() {
  git branch
  printCommand '[git branch]'
}

function gbla() {
  git branch -a
  printCommand '[git branch -a]'
}

function gbd() {
  git branch -D $@
  printCommand '[git branch -D <name>]'
}

function gblr() {
  git show-branch --remote
  printCommand '[git show-branch --remote]'
}

function gsearch() {
  git log --all -i --grep="$@"
  printCommand 'git log --all -i --grep=<value>'
}

function grh() {
  git reset --hard
  printCommand "[git reset --hard]"
  git clean -fd
  printCommand "[git clean -fd]"
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
function groot() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  cd $REPO_PATH
}

function gw() {
  git worktree $@
  printCommand '[git worktree <command>]'
}

function gwl() {
  git worktree list
  printCommand '[git worktree list]'
}

function gwa() {
  git worktree add $@
  printCommand '[git worktree add <name>]'
}

function gwr() {
  git worktree remove $@
  printCommand '[git worktree remove <name>]'
}
