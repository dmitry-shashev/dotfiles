import { DataHelper } from '../helpers/data.helper'
import { FileHelper } from '../helpers/file.helper'

export function restoreAction(): void {
  const data = DataHelper.getTargetData()
  data.map(({ files, folder }) => {
    FileHelper.restoreFolders(files, folder)
  })
}
