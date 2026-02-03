---
id: nvim-6
title: "Performance tuning for local model"
type: task
priority: 2
status: closed
created: 2026-02-03
updated: 2026-02-03
closed: 2026-02-03
parent: nvim-1
description: "Optimize throttle, debounce, and n_completions for local LM Studio inference speed"
---

# Performance tuning for local model

Reduced load on local model for faster inline suggestions:
- n_completions: 3 -> 1 (single request instead of 3 parallel)
- debounce: 400ms -> 200ms (trigger sooner after typing pause)
- throttle: 1000ms -> 500ms (allow requests twice as often)
