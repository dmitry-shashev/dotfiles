import { homedir } from 'os'
import { cpSync, existsSync, CopySyncOptions } from 'fs'
import { mkdirSync, readdirSync, statSync } from 'node:fs'
import { join, dirname } from 'node:path'
import { excludePaths } from './exclude-paths'

const options: CopySyncOptions = {
  recursive: true,
  force: true,
}

export abstract class FileHelper {
  private static isPathAllowed(path: string): boolean {
    return excludePaths.every((t) => !path.includes(t))
  }

  private static findAllFiles(
    dirPath: string,
    fileList: Array<string> = []
  ): Array<string> {
    // a special case if the filename was passed
    if (!statSync(dirPath).isDirectory()) {
      if (FileHelper.isPathAllowed(dirPath)) {
        return [dirPath]
      }
      return []
    }

    const files = readdirSync(dirPath)
    files.forEach((file): void => {
      const fullPath = join(dirPath, file)
      if (statSync(fullPath).isDirectory()) {
        FileHelper.findAllFiles(fullPath, fileList)
      } else {
        if (FileHelper.isPathAllowed(fullPath)) {
          fileList.push(fullPath)
        }
      }
    })
    return fileList
  }

  public static copyFolders(
    files: ReadonlyArray<string>,
    subFolderName: string
  ): void {
    files.forEach((file) => {
      let userHomeDir = ''
      if (!/^\/mnt\//.test(file)) {
        userHomeDir = homedir()
      }
      const finalFilePath = join(userHomeDir, file)

      const files = FileHelper.findAllFiles(finalFilePath)
      files.forEach((filePath) => {
        const relativePath = filePath.replace(`${userHomeDir}/`, '')
        const finalPath = `./files/${subFolderName}/${relativePath}`

        // create if it does not exist
        const dirPath = dirname(finalPath)
        if (!existsSync(dirPath)) {
          mkdirSync(dirPath, { recursive: true })
        }

        cpSync(filePath, finalPath, options)
      })
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
