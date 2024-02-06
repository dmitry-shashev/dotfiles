import { FILES_LIST_LINUX, FILES_LIST_MAC } from '../constants/files-list'
import { TargetData } from '../interfaces/target-data'

export abstract class DataHelper {
  public static getTargetData(): TargetData {
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
    }

    if (!folder) {
      throw new Error('Can not determine the target')
    }

    return {
      files,
      folder,
    }
  }
}
