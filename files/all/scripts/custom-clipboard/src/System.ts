import { arch } from 'node:os'
// @ts-ignore
import robot from 'robotjs'

export class System {
  private static sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms))
  }

  private static isMac(): boolean {
    return arch() === 'arm64'
  }

  private static isLinux(): boolean {
    return !System.isMac()
  }

  public static async pressCtrlC(): Promise<void> {
    await System.sleep(200)

    if (System.isLinux()) {
      robot.keyTap('c', ['control'])
    }

    if (System.isMac()) {
      robot.keyTap('c', ['command'])
    }

    await System.sleep(100)
  }

  public static async pressCtrlV(): Promise<void> {
    await System.sleep(200)

    if (System.isLinux()) {
      robot.keyTap('v', ['control', 'shift'])
    }

    if (System.isMac()) {
      robot.keyTap('v', ['command'])
    }

    await System.sleep(100)
  }
}
