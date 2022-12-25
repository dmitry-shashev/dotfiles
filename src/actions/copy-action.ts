import { FileHelper } from '../helpers/file.helper'
import { DataHelper } from '../helpers/data.helper'

export function copyAction(): void {
  const { files, folder } = DataHelper.getTargetData()
  FileHelper.copyFolders(files, folder)
}
