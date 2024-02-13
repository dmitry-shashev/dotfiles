const fs = require('fs')
const { execSync } = require('child_process');
const os = require("os");

const targetFolder = process.argv[2]
const hash = require('crypto').createHash('sha256').update(targetFolder, 'utf8').digest('hex').slice(0, 6);
const currentFolderName = targetFolder.split('/').pop()
const backupFolder = `${os.homedir()}/backups/${currentFolderName}-${hash}`
const foldersForExlude = require('./folders-to-exclude.json')
const exclude = foldersForExlude.map(v => `--exclude ${v}`).join(' ')

if (!fs.existsSync(backupFolder)) {
  fs.mkdirSync(backupFolder, { recursive: true }) 
  execSync('git init', {
    cwd: backupFolder
  })
}

setInterval(() => {
  const result = execSync(`rsync -ahv ${exclude} ${targetFolder}/ ${backupFolder}/ --delete`)
  console.log(result.toString())

  const shouldCommit = execSync(`git status --short`, {
    cwd: backupFolder
  })
  if (shouldCommit.toString()) {
    execSync('git switch master', {
      cwd: backupFolder,
    })
    execSync(`git add --all`, {
      cwd: backupFolder
    })
    execSync(`git commit -m "${(new Date()).toISOString()}"`, {
      cwd: backupFolder
    })
  }
}, 300000) // 5 min interval

