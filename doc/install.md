#### Start

```bash
p init
```

#### Install typescript

```bash
p add -D typescript
```

#### Add configs

> Add `tsconfig.json`

> Add `.npmrc`

#### Install prettier

```bash
p add -D prettier
```

> Add `prettier`, `engines`, `packageManager` in `package.json`

#### Install eslint

```bash
pnpm add -D eslint
pnpm add -D eslint-config-prettier eslint-plugin-prettier
pnpm add -D eslint-plugin-import
pnpm add -D @typescript-eslint/eslint-plugin
```

> Add `.eslintrc.json`

#### Add copy library

```bash
pnpm add recursive-copy
```