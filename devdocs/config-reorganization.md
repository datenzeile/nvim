# Config Reorganization

## Overview

Flattened the kickstart.nvim directory structure from split `kickstart/plugins/` + `custom/plugins/` into a single `lua/plugins/` directory. Removed dead plugins, added ABOUTME headers, fixed keymaps, and added Go + Python LSP support.

## Structure Change

### Before
```
lua/
├── kickstart/plugins/  (13 files)
├── custom/plugins/     (8 files)
```

### After
```
lua/
├── plugins/            (17 files, all in one place)
```

## Plugin Loading

Changed from individual `require` calls in `lazy-plugins.lua` to the `{ import = 'plugins' }` pattern. This auto-loads all `.lua` files in `lua/plugins/`. Disabled plugins use `enabled = false` to prevent loading.

## Removed Plugins (7 files)

| File | Reason |
|------|--------|
| `claude-code.lua` | Community duplicate (keeping official `claudecode.lua`) |
| `supermaven.lua` | Replaced by minuet-ai |
| `zen-mode.lua` | Snacks.nvim handles zen mode |
| `nvim-tree.lua` | Snacks.nvim has built-in explorer |
| `neo-tree.lua` | Snacks.nvim explorer replaces this |
| `debug.lua` | Go DAP, not used |
| `custom/plugins/init.lua` | Empty placeholder |

## Keymap Changes

| Key | Before | After |
|-----|--------|-------|
| `<leader>z` | Conflict: zen-mode.nvim + snacks | Snacks zen only |
| `<leader>Z` | Snacks zoom | Unchanged |
| `<leader>n` | Conflict: nvim-tree + snacks notification | Snacks notification only |

## LSP Additions

| Server | Language | Config |
|--------|----------|--------|
| `gopls` | Go | staticcheck + unusedparams analysis |
| `ruff` | Python | Linting and formatting (default config) |

### Mason Tools Added
- `gofumpt` — Go formatter
- `goimports` — Go import organizer

### Treesitter Parsers Added
- `go`, `gomod`

### Conform Formatters Added
- `go = { 'gofumpt', 'goimports' }`

## Other Fixes

- All `.lua` files now have ABOUTME headers
- `claudecode.lua`: Replaced `NvimTree` with `snacks_explorer` in ft list
- `minuet-ai.lua`: Replaced `NvimTree` with `snacks_explorer` in ignore list
- `options.lua`: Removed abandoned ruff LSP config comments
- `blink-cmp.lua`: Inlined minuet keymap function to avoid load order issue
- Disabled plugins (`autopairs`, `indent_line`, `lint`) have `enabled = false`

## Related Issues

- Epic: nvim-8 (Config reorganization)
- Tasks: nvim-9 through nvim-14
