import { DataHelper } from '../helpers/data.helper'
import { FileHelper } from '../helpers/file.helper'

export function restoreAction(): void {
  const { files, folder } = DataHelper.getTargetData()
  FileHelper.restoreFolders(files, folder)
}
