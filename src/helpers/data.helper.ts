import {
  FILES_LIST_ALL,
  FILES_LIST_LINUX,
  FILES_LIST_MAC,
  FILES_LIST_WINDOWS,
} from '../constants/files-list'
import { TargetData } from '../interfaces/target-data'

export abstract class DataHelper {
  public static getTargetData(): Array<TargetData> {
    let files: ReadonlyArray<string> = []
    let folder = ''
    const target = String(process.env.TARGET)
    switch (target) {
      case 'LINUX':
        files = FILES_LIST_LINUX
        folder = 'linux'
        break

      case 'MAC':
        files = FILES_LIST_MAC
        folder = 'mac'
        break

      case 'WINDOWS':
        files = FILES_LIST_WINDOWS
        folder = 'windows'
        break
    }

    if (!folder) {
      throw new Error('Can not determine the target')
    }

    return [
      {
        files,
        folder,
      },
      {
        files: FILES_LIST_ALL,
        folder: 'all',
      },
    ]
  }
}
