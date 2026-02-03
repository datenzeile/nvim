---
id: nvim-8
title: "Reorganize nvim config: flatten kickstart/custom into plugins/"
type: epic
priority: 1
status: closed
created: 2026-02-03
updated: 2026-02-03
closed: 2026-02-03
description: "Flatten directory structure, remove dead plugins, add ABOUTME headers, add Go+Python LSP, fix keymaps"
---

# Reorganize nvim config

## Subtasks
- nvim-9: Remove dead plugins (claude-code, supermaven, zen-mode, nvim-tree, neo-tree, debug, init.lua)
- nvim-10: Flatten kickstart/plugins/ and custom/plugins/ into plugins/
- nvim-11: Rewrite lazy-plugins.lua with import pattern
- nvim-12: Add ABOUTME headers to all lua files
- nvim-13: Add Go (gopls) and Python (ruff) LSP support
- nvim-14: Fix claudecode ft list, minuet ignore list, options cleanup
