Doesn't work with neovim in the terminal, because the terminal
works on the system level.

On mac it uses skhd `/Users/dshashev/.skhdrc`

```
shift + alt - 1 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 1
shift + alt - 2 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 2
shift + alt - 3 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 3
shift + alt - 4 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 4
shift + alt - 5 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 5
shift + alt - 6 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 6
shift + alt - 7 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 7
shift + alt - 8 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 8
shift + alt - 9 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 9
shift + alt - 0 : tsx ~/scripts/custom-clipboard/load-clipboard.ts 0

ctrl + shift + alt - 1 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 1
ctrl + shift + alt - 2 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 2
ctrl + shift + alt - 3 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 3
ctrl + shift + alt - 4 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 4
ctrl + shift + alt - 5 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 5
ctrl + shift + alt - 6 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 6
ctrl + shift + alt - 7 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 7
ctrl + shift + alt - 8 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 8
ctrl + shift + alt - 9 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 9
ctrl + shift + alt - 0 : tsx ~/scripts/custom-clipboard/save-clipboard.ts 0
```

It saves clipboards into `/Users/dshashev/custom-clipboards/*.txt`

It takes currently selected text, presses on the system level Ctrl+C, then
it saves current clipboard to a specific folder
