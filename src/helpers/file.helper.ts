import { homedir, version } from 'os'
import * as fs from 'fs'

// eslint-disable-next-line @typescript-eslint/no-var-requires
const copy = require('recursive-copy')

const options = {
  overwrite: true,
  dot: true,
}

export abstract class FileHelper {
  public static copyFolder(
    files: ReadonlyArray<string>,
    subfolderName: string
  ): void {
    const userHomeDir = homedir()
    files.forEach((file) => {
      const fileBasePath = `${userHomeDir}/${file}`
      if (!fs.existsSync(fileBasePath)) {
        return
      }
      copy(fileBasePath, `./files/${subfolderName}/${file}`, options)
    })
  }
}
