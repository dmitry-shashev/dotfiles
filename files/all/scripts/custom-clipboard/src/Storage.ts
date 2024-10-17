import { homedir } from 'node:os'
import { existsSync, readFileSync, writeFileSync, mkdirSync } from 'node:fs'

export class Storage {
  private static buildFolderPath(): string {
    return `${homedir()}/custom-clipboards`
  }

  private static buildClipboardPath(clipboardNum: string): string {
    const folderPath = this.buildFolderPath()
    return `${folderPath}/${clipboardNum}.txt`
  }

  public static ensureClipFolderExists(): void {
    const folderPath = this.buildFolderPath()
    if (!existsSync(folderPath)) {
      mkdirSync(folderPath)
    }
  }

  public static writeOnDisk(clipboardNum: string, clipboardData: string): void {
    if (!clipboardNum || !clipboardData) {
      return
    }

    const clipboardPath = Storage.buildClipboardPath(clipboardNum)
    writeFileSync(clipboardPath, clipboardData, 'utf-8')
  }

  public static readFromDisk(clipboardNum: string): string {
    if (!clipboardNum) {
      return ''
    }

    const clipboardPath = Storage.buildClipboardPath(clipboardNum)
    if (!existsSync(clipboardPath)) {
      return ''
    }

    return readFileSync(clipboardPath, 'utf-8').trim()
  }
}
