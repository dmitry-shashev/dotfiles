const clipboardNum = process.argv[2]

const fs = require('fs')
const os = require('os')
const ks = require('node-key-sender')
const { execSync } = require('child_process')

const FOLDER_PATH = `${os.homedir()}/custom-clipboards`
const CLIPBOARD_PATH = `${FOLDER_PATH}/${clipboardNum}.txt`

if (!fs.existsSync(FOLDER_PATH)) {
  fs.mkdirSync(FOLDER_PATH)
}

if (!fs.existsSync(CLIPBOARD_PATH)) {
  // @#$
  // eslint-disable-next-line no-console
  console.log(CLIPBOARD_PATH)
  return
}

const clipboardData = fs.readFileSync(CLIPBOARD_PATH, 'utf-8').trim()

copyToClipboard(clipboardData)
sendPaste()

//----------------------------------------------------------
function copyToClipboard(str) {
  const command = os.arch() === 'arm64' ? 'pbcopy' : 'xclip -sel clip'
  execSync(`echo ${str}|${command}`, { stdio: 'inherit' })
}

function sendPaste() {
  if (os.arch() === 'arm64') {
    // we send for macs using AppleScript
    return
  }
  ks.sendCombination(['control', 'shift', 'v'], 200)
}
//----------------------------------------------------------
