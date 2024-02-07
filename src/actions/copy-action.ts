import { DataHelper } from '../helpers/data.helper'
import { FileHelper } from '../helpers/file.helper'

export function copyAction(): void {
  const data = DataHelper.getTargetData()
  data.map(({ files, folder }) => {
    FileHelper.copyFolders(files, folder)
  })
}
