---
id: nvim-7
title: "Optimize minuet-ai and blink-cmp configuration"
type: task
priority: 2
status: closed
closed: 2026-02-03
created: 2026-02-03
updated: 2026-02-03
parent: nvim-1
description: "Tune minuet-ai for faster local inference and better UX: reduce max_tokens, context_window, add request_timeout, ignore non-code filetypes, enable virtual text on completion menu, add manual trigger keymap"
---

# Optimize minuet-ai and blink-cmp configuration

## Changes
1. Reduce `max_tokens` from 256 to 100 (inline completions are short)
2. Set `request_timeout` to 2s explicitly
3. Reduce `context_window` from 16000 to 8000 (less prompt = faster inference)
4. Add `auto_trigger_ignore_ft` for non-code buffers
5. Set `show_on_completion_menu = true` (virtual text visible alongside blink menu)
6. Align blink `timeout_ms` to 2000 to match request_timeout
7. Add `<A-y>` keymap for manual minuet-only trigger in blink
8. Fix model string typo (mistral -> mistralai)
