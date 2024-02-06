const { readFileSync, writeFileSync } = require('fs')

const filePath =  process.argv.slice(1)[1];

try {
  const file = readFileSync(filePath, 'utf8')
  const fileParsed = JSON.parse(file)
  const fileFormatted = JSON.stringify(fileParsed, null, 2)
  writeFileSync(filePath, fileFormatted)
} catch (_) {
  // do nothing
}

