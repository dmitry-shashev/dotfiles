# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A dotfiles management tool built in TypeScript. It copies config files (nvim, tmux, kitty, i3, zsh, etc.) between the user's home directory and this repo, organized by OS target (linux, mac, windows) plus a shared "all" folder for unix-common configs.

## Commands

Package manager is **pnpm** (enforced via `.npmrc` engine-strict).

```bash
# Copy dotfiles FROM home directory INTO this repo
pnpm copy-linux    # Linux-specific + shared unix files
pnpm copy-mac      # Mac-specific + shared unix files
pnpm copy-windows  # Windows-specific files only

# Restore dotfiles FROM this repo INTO home directory
pnpm restore-linux
pnpm restore-mac
pnpm restore-windows

# Lint and type-check
pnpm lint          # ESLint (runs on pre-push hook)
pnpm tsc           # TypeScript compilation (runs on pre-commit hook)
```

## Git Hooks (Husky)

- **pre-commit**: Auto-bumps patch version, runs prettier, stages all changes, then runs `tsc`
- **pre-push**: Runs `pnpm lint`

## Architecture

The TypeScript source in `src/` is a CLI tool driven by two env vars: `TARGET` (LINUX|MAC|WINDOWS) and `ACTION` (COPY|RESTORE).

- `src/index.ts` — Entry point; reads `ACTION` env var, dispatches to copy or restore
- `src/helpers/data.helper.ts` — Reads `TARGET` env var, returns the file list + folder name. Linux/Mac targets include both OS-specific files AND shared unix files (`FILES_LIST_UNIX`)
- `src/helpers/file.helper.ts` — File operations: `copyFolders` (home → repo) walks the directory tree filtering by `excludePaths`, `restoreFolders` (repo → home) uses `cpSync`
- `src/constants/files-list.ts` — Per-OS file path lists relative to `$HOME`. Add new dotfiles to manage here.
- `src/helpers/exclude-paths.ts` — Paths to skip during copy (node_modules, .git, dist, etc.)

The `files/` directory holds the actual dotfile copies, organized as `files/{all,linux,mac,windows}/`.

## Code Style

- ESLint enforces: explicit return types, no `any`, `Array<T>` syntax (not `T[]`), no console/alert/debugger, 1TBS brace style, single quotes
- Prettier: no semicolons, single quotes, trailing commas (es5), 2-space tabs
- TypeScript strict mode enabled
