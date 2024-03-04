const path = require("path")
const fs = require("fs")

const fullBasePath = process.argv[2]
const resources = process.argv.slice(3)

const subPathToSkipList = ['/node_modules/', '/.git/']

function scanResources(pathForSearching) {
  let resources  = []

  function findResources(dir) {
    fs.readdirSync(dir).forEach(file => {
      const currentPath = path.join(dir, file)
      resources.push(currentPath)
      if (fs.statSync(currentPath).isDirectory()) {
        return findResources(currentPath)
      }
      return resources
    })
  }

  findResources(pathForSearching)

  return resources
}

//----------------------------------------------------------
// Find resources for removing

const foundResources = scanResources(fullBasePath)
const resourcesForRemoving = foundResources
  .filter(v => resources.some(t => v.endsWith(t)))
  .filter(v => subPathToSkipList.every(t => !v.includes(t)))

//----------------------------------------------------------

if (resourcesForRemoving.length === 0) {
  console.log('No resources were found')
  return
}

const message = `Remove next resources? (y/n)
${JSON.stringify(resourcesForRemoving, null, 2)}
`
const readline = require('node:readline').createInterface({
  input: process.stdin,
  output: process.stdout,
})
readline.question(message, (ans) => {
  if (['y', 'yes'].includes(ans)) {
    resourcesForRemoving.forEach((r) => {
      fs.rm(r, { recursive: true }, (err) => {
        if (err) {
          console.error(err)
        }
      })
    })
    console.log('Files have been removed')
  }
  readline.close()
})


