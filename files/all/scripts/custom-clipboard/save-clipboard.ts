import { Clipboard } from './src/Clipboard'
import { Storage } from './src/Storage'
import { System } from './src/System'

const clipboardNum = process.argv[2]

await System.pressCtrlC()
const clipboardData = Clipboard.read()
Storage.ensureClipFolderExists()
Storage.writeOnDisk(clipboardNum, clipboardData)
