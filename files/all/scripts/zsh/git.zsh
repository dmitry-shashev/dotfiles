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
  git checkout $@
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

function gmainname() {
  # local DEFAULT_BRANCH_NAME=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  git remote show origin 2>/dev/null | grep 'HEAD branch' | awk '{print $NF}'
}

function gsync() {
  local DEFAULT_BRANCH_NAME=$(gmainname)
  git checkout $DEFAULT_BRANCH_NAME
  printCommand "[git checkout $DEFAULT_BRANCH_NAME]"
  git pull origin $DEFAULT_BRANCH_NAME
  printCommand "[git pull origin $DEFAULT_BRANCH_NAME]"
}

function gamend() {
  git add --all
  printCommand "[git add --all]"
  git commit --amend --no-edit
  printCommand "[git commit --amend --no-edit]"
}

function gmerge() {
  local DEFAULT_BRANCH_NAME=$(gmainname)
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
  local DEFAULT_BRANCH_NAME=$(gmainname)
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
  local REMOTES=($(git remote))
  local TARGET_REMOTE="origin"

  for remote in "${REMOTES[@]}"; do
    if [[ "$remote" != "origin" ]]; then
      TARGET_REMOTE="$remote"
      break
    fi
  done

  git push $TARGET_REMOTE $CURRENT_BRANCH_NAME
  printCommand "[git push $TARGET_REMOTE $CURRENT_BRANCH_NAME]"
}

function gpushforce() {
  local CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
  local REMOTES=($(git remote))
  local TARGET_REMOTE="origin"

  for remote in "${REMOTES[@]}"; do
    if [[ "$remote" != "origin" ]]; then
      TARGET_REMOTE="$remote"
      break
    fi
  done

  git push $TARGET_REMOTE $CURRENT_BRANCH_NAME --force
  printCommand "[git push $TARGET_REMOTE $CURRENT_BRANCH_NAME --force]"
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
  # Save current state to a temp branch
  local temp_branch="backup/$(date +%Y%m%d_%H%M%S)"
  local current_branch=$(git branch --show-current)
  
  # Stage everything (tracked + untracked) and create a temp commit
  git checkout -b "$temp_branch"
  git add -A
  git commit -m "backup: auto-save before grh on '$current_branch'" --allow-empty --no-verify
  
  # Return to original branch and do the reset
  git checkout "$current_branch"
  git reset --hard
  printCommand "[git reset --hard]"
  git clean -fd
  printCommand "[git clean -fd]"
  
  echo "💾 State saved to branch: $temp_branch"
  echo "   Restore with: git checkout $temp_branch"
}

#open changed files
function go() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  git status --porcelain | grep -v "[/]$" | grep -v "^\s*D" | sed s%...%% | sed "s%^%${REPO_PATH}/%g" | sed 's/ /\\ /g' | xargs -o nvim -p
}

# navigate to the git root
function groot() {
  local REPO_PATH="$(git rev-parse --show-toplevel)"
  cd $REPO_PATH
}

#----------------------------------------------------------
# Autocompletion

function _gch_autocomplete() {
  local -a branches
  branches=("${(@f)$(git branch --format="%(refname:short)")}")
  _describe 'branch' branches
}

compdef _gch_autocomplete gch
compdef _gch_autocomplete gbd
