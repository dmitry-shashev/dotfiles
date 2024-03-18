function rmr() {
  local CURRENT_PATH=$(pwd)
  node "$HOME/scripts/zsh/extra/rmr.js" "$CURRENT_PATH" $@
}

function backup-watch() {
  local CURRENT_PATH=$(pwd)
  # every 5 min
  watch -n 300 node "$HOME/scripts/zsh/extra/backup.js" "$CURRENT_PATH"
}

function restore() {
  local CURRENT_PATH=$(pwd)
  node "$HOME/scripts/zsh/extra/restore.js" "$CURRENT_PATH" $@
}

function update() {
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get clean -y
}

function sync() {
  local CURRENT_PATH=$(pwd)
  node "$HOME/scripts/zsh/extra/sync.js"
}

function run() {
  update
  sync
  ~/run.sh
}
