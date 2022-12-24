import { FILES_LIST_ARCH, FILES_LIST_MAC } from '../constants/files-list'
import { FileHelper } from '../helpers/file.helper'

export function copyAction(): void {
  let files: ReadonlyArray<string> = []
  let folder = ''
  const target = String(process.env.TARGET)
  switch (target) {
    case 'ARCH':
      files = FILES_LIST_ARCH
      folder = 'arch'
      break

    case 'MAC':
      files = FILES_LIST_MAC
      folder = 'mac'
      break
  }

  if (!folder) {
    throw new Error('Can not determine the target')
  }

  FileHelper.copyFolder(files, folder)
}
