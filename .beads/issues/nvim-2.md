---
id: nvim-2
title: "Fix minuet-ai plugin spec structure"
type: task
priority: 1
status: closed
created: 2026-02-03
updated: 2026-02-03
closed: 2026-02-03
parent: nvim-1
description: "Rewrite minuet-ai.lua from broken specs wrapper to flat lazy.nvim spec"
---

# Fix minuet-ai plugin spec structure

The original minuet-ai.lua used a `specs` key wrapping the plugin definition, which is incorrect for the `require` pattern used in lazy-plugins.lua. Rewrote to flat spec matching other custom plugins.
