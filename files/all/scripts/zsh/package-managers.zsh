# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

function p() {
  pnpm $@
}
function y() {
  yarn $@
}
function b() {
  bun $@
}
# function n() {
#   npm $@
# }

function pd() {
  COMMAND="pnpm $@" dc up
}

function py() {
  python3 $@
}
function python() {
  python3 $@
}
