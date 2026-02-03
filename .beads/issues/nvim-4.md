---
id: nvim-4
title: "Integrate minuet with blink.cmp"
type: task
priority: 1
status: closed
created: 2026-02-03
updated: 2026-02-03
closed: 2026-02-03
parent: nvim-1
description: "Register minuet as async completion source in blink-cmp config"
---

# Integrate minuet with blink.cmp

Added `minuet` to blink.cmp `sources.default` and registered the provider with:
- module: `minuet.blink`
- async: true
- timeout_ms: 3000
- score_offset: 50
