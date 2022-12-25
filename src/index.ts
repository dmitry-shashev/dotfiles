import * as process from 'process'
import { copyAction } from './actions/copy-action'
import { restoreAction } from './actions/restore-action'

const action = String(process.env.ACTION)

switch (action) {
  case 'COPY':
    copyAction()
    break

  case 'RESTORE':
    restoreAction()
    break

  default:
    throw new Error('Action was not found')
}
