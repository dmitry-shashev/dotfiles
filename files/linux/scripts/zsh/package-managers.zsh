# pnpm
export PNPM_HOME="/home/picnic/.local/share/pnpm"
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
function y() {
  npm $@
}
