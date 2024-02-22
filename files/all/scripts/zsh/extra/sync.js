const { execSync, exec } = require('child_process');
const os = require("os");

const HOME_DIR = os.homedir()
const DOMAINS_DIR = `${HOME_DIR}/domains`

// main
;(async () => {
  const repoFolders = findAllRepositories()
  const pullResult = await pullAllRepositories(repoFolders)
  // eslint-disable-next-line no-console
  console.log(pullResult)
  restoreDotfiles()
})()

//------------------------------------------------------------

function findAllRepositories() {
  const result = execSync(`find ${DOMAINS_DIR} -type f -iname "*.gitignore*" ! -path "*/node_modules/*" ! -path "*/.*/*"`, {
    cwd: DOMAINS_DIR
  })
    .toString()
    .split('\n')
    .map(v => v.replace(/\/\.gitignore.*/, '').trim())
    .filter(v => !!v)

  result.push(`${HOME_DIR}/lib`)
  
  return result
}


async function pullAllRepositories(repoFolders) {
  // helper function
  function getBranchName(folder) {
    return execSync('git rev-parse --abbrev-ref HEAD', {
      cwd: folder,
    }).toString().replace('\n', '')
  }

  return Promise.all(
    repoFolders.map((repoPath) => {
      return new Promise((resolve, reject) => {
        const branchName = getBranchName(repoPath)
        exec(`git pull origin ${branchName}`, {
          cwd: repoPath
        }, (err, out) => {
          if (err) {
            reject(err)
            return
          }
          resolve(`[${branchName}] ${repoPath}: ${out.replace('\n', '')}`)
        })
      })
    })
  )
}

function restoreDotfiles() {
  execSync('pnpm run restore-linux', {
    cwd: `${DOMAINS_DIR}/dotfiles`
  })
}


