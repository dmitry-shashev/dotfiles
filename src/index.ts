import * as process from 'process'
import { copyAction } from './actions/copy-action'

const action = String(process.env.ACTION)

switch (action) {
  case 'COPY':
    copyAction()
    break

  default:
    throw new Error('Action was not found')
}
