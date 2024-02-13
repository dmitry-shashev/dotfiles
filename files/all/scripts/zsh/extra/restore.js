const fs = require('fs')
const { execSync } = require('child_process');
const os = require("os");

const targetFolder = process.argv[2]
const hash = require('crypto').createHash('sha256').update(targetFolder, 'utf8').digest('hex').slice(0, 6);
const commit = process.argv[3]
const currentFolderName = targetFolder.split('/').pop()
const backupFolder = `${os.homedir()}/backups/${currentFolderName}-${hash}`
const foldersForExlude = require('./folders-to-exclude.json')
const exclude = foldersForExlude.map(v => `--exclude ${v}`).join(' ')

if (!fs.existsSync(backupFolder)) {
  console.log('The backup does not exist')
  return
}

// checks
const shouldTargetCommit = execSync(`git status --short`, {
  cwd: targetFolder
})
const shouldBackupCommit = execSync(`git status --short`, {
  cwd: backupFolder
})
if (shouldTargetCommit.toString()) {
  console.log('Target repository has changes, aborting')
  return
}
if (shouldBackupCommit.toString()) {
  console.log('Backup repository has changes, aborting')
  return
}

[targetFolder, backupFolder].forEach((folder) => {
  const found = execSync(`git status --short`, {
    cwd: backupFolder
  })
  if (found.toString()) {
    console.log(`Repository has changes, aborting: ${folder}`)
    return
  }
})

// check if the commit exists
try {
  execSync(`git diff ${commit}`, {
    cwd: backupFolder,
  })
} catch {
  console.log('Backup commit was not found')
  return
}
execSync('git switch master', {
  cwd: backupFolder,
})

console.log(`Commit: ${commit}`)

const branchesList = execSync(`git branch`, {
  cwd: backupFolder,
}).toString()
if (/restore/i.test(branchesList)) {
  console.log('Removing existing "restore" branch')
  execSync('git branch -D restore', {
    cwd: backupFolder,
  })
}

execSync(`git checkout -b restore ${commit}`, {
  cwd: backupFolder,
})

const result = execSync(`rsync -ahv ${exclude} ${backupFolder}/ ${targetFolder}/`)
console.log(result.toString())

execSync('git switch master', {
  cwd: backupFolder,
})
execSync('git branch -D restore', {
  cwd: backupFolder,
})
