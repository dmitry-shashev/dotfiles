import { homedir } from 'os'
import * as fs from 'fs'
import copy from 'recursive-copy'

const options = {
  overwrite: true,
  dot: true,
}

export abstract class FileHelper {
  public static copyFolders(
    files: ReadonlyArray<string>,
    subFolderName: string
  ): void {
    const userHomeDir = homedir()
    files.forEach((file) => {
      const fileBasePath = `${userHomeDir}/${file}`
      if (!fs.existsSync(fileBasePath)) {
        return
      }
      copy(fileBasePath, `./files/${subFolderName}/${file}`, options)
    })
  }

  public static restoreFolders(
    files: ReadonlyArray<string>,
    subFolderName: string
  ): void {
    const userHomeDir = homedir()
    files.forEach((file) => {
      const fileBasePath = `${userHomeDir}/${file}`
      if (!fs.existsSync(fileBasePath)) {
        return
      }
      copy(`./files/${subFolderName}/${file}`, fileBasePath, options)
    })
  }
}
