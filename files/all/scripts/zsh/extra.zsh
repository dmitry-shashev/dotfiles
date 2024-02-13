function rmr() {
  local CURRENT_PATH=$(pwd)
  node "$HOME/scripts/zsh/extra/rmr.js" "$CURRENT_PATH" $@
}

function backup() {
  local CURRENT_PATH=$(pwd)
  node "$HOME/scripts/zsh/extra/backup.js" "$CURRENT_PATH"
}

function restore() {
  local CURRENT_PATH=$(pwd)
  node "$HOME/scripts/zsh/extra/restore.js" "$CURRENT_PATH" $@
}
