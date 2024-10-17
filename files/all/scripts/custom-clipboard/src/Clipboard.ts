import clipboard from 'clipboardy'

export class Clipboard {
  public static read(): string {
    return clipboard.readSync()
  }

  public static write(str: string): void {
    clipboard.writeSync(str)
  }
}
