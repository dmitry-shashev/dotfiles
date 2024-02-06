import { homedir } from 'os'
import { cpSync, existsSync, CopySyncOptions } from 'fs'

const options: CopySyncOptions = {
  recursive: true,
  force: true,
}

export abstract class FileHelper {
  public static copyFolders(
    files: ReadonlyArray<string>,
    subFolderName: string
  ): void {
    const userHomeDir = homedir()
    files.forEach((file) => {
      const basePath = `${userHomeDir}/${file}`
      // we could specify in a list of files for backuping
      // which doesn't exist in the current linux distro
      if (existsSync(basePath)) {
        const finalPath = `./files/${subFolderName}/${file}`
        cpSync(basePath, finalPath, options)
      }
    })
  }

  public static restoreFolders(
    files: ReadonlyArray<string>,
    subFolderName: string
  ): void {
    const userHomeDir = homedir()
    files.forEach((file) => {
      const basePath = `./files/${subFolderName}/${file}`
      const finalPath = `${userHomeDir}/${file}`
      cpSync(basePath, finalPath, options)
    })
  }
}
