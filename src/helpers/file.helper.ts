import { homedir } from 'os'
import { existsSync, cpSync, CopySyncOptions } from 'fs'

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
      const fileBasePath = `${userHomeDir}/${file}`
      if (!existsSync(fileBasePath)) {
        return
      }
      cpSync(fileBasePath, `./files/${subFolderName}/${file}`, options)
    })
  }

  public static restoreFolders(
    files: ReadonlyArray<string>,
    subFolderName: string
  ): void {
    const userHomeDir = homedir()
    files.forEach((file) => {
      const fileBasePath = `${userHomeDir}/${file}`
      if (!existsSync(fileBasePath)) {
        return
      }
      cpSync(`./files/${subFolderName}/${file}`, fileBasePath, options)
    })
  }
}
