import { Clipboard } from './src/Clipboard'
import { System } from './src/System'
import { Storage } from './src/Storage'

const clipboardNum = process.argv[2]

const clipboardData = Storage.readFromDisk(clipboardNum)
Clipboard.write(clipboardData)
await System.pressCtrlV()
