---
id: nvim-14
title: "Fix claudecode ft list, minuet ignore, options cleanup"
type: task
priority: 2
status: closed
created: 2026-02-03
updated: 2026-02-03
closed: 2026-02-03
parent: nvim-8
description: "Remove NvimTree references, clean abandoned LSP comments in options.lua, add enabled=false to disabled plugins"
---

# Targeted fixes
- claudecode.lua: remove NvimTree from ft list, add snacks_explorer
- minuet-ai.lua: remove NvimTree from auto_trigger_ignore_ft
- options.lua: remove abandoned ruff LSP comments
- Disabled plugins: add enabled = false
