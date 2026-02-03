# Minuet AI Plugin Setup

## Overview

Replaced Supermaven with [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) for LLM-powered code completion using a local LM Studio instance.

## Architecture

```
Neovim -> minuet-ai.nvim -> LM Studio (http://127.0.0.1:1234)
                |                         |
                |-- blink.cmp source      |-- /v1/completions (FIM endpoint)
                |-- virtual text overlay  |-- Local models (devstral, glm-4.7-flash, etc.)
```

## Key Files

| File | Purpose |
|------|---------|
| `lua/custom/plugins/minuet-ai.lua` | Plugin spec and provider configuration |
| `lua/kickstart/plugins/blink-cmp.lua` | Blink.cmp with minuet source registered |
| `lua/lazy-plugins.lua` | Plugin load order (supermaven disabled, minuet enabled) |

## Configuration Details

### Provider: `openai_fim_compatible`

Minuet-ai supports two OpenAI-compatible provider types:

- `openai_compatible` — uses `/v1/chat/completions` (chat models)
- `openai_fim_compatible` — uses `/v1/completions` (FIM/code completion models)

LM Studio with devstral/glm requires the **FIM** endpoint. Using the chat endpoint will result in responses that don't parse as completion items.

### API Key

LM Studio doesn't require authentication. The `api_key` field must be a **function** returning a dummy string, not a plain string. A plain string is treated as an environment variable name by minuet-ai.

```lua
-- Wrong: looks for env var called "lm-studio"
api_key = 'lm-studio',

-- Correct: returns literal value
api_key = function() return 'lm-studio' end,
```

### Performance Tuning

Settings optimized for local model latency:

| Setting | Default | Current | Rationale |
|---------|---------|---------|-----------|
| `n_completions` | 3 | 1 | FIM sends N parallel curl requests; 1 reduces local model load |
| `debounce` | 400ms | 200ms | Trigger completion sooner after typing pause |
| `throttle` | 1000ms | 500ms | Allow requests more frequently |
| `max_tokens` | 256 | 100 | Inline completions are short; less generation = faster response |
| `request_timeout` | 3s | 2s | Tighter feedback loop; streaming gives partial results anyway |
| `context_window` | 16000 | 8000 | Fewer prompt tokens = faster local model inference |

### Virtual Text

Enabled for all filetypes (`auto_trigger_ft = { '*' }`), with ignored filetypes for non-code buffers (help, gitcommit, TelescopePrompt, lazy, mason, NvimTree, snacks_dashboard). Virtual text remains visible when the blink.cmp completion menu is open (`show_on_completion_menu = true`). Keymaps:

| Key | Action |
|-----|--------|
| `Alt-Shift-A` | Accept full suggestion |
| `Alt-a` | Accept current line |
| `Alt-[` / `Alt-]` | Previous / next suggestion |
| `Alt-e` | Dismiss suggestion |

### Blink.cmp Integration

Minuet registered as async source in blink-cmp with 2s timeout and score offset 50 (below LSP at 100). Manual trigger keymap `Alt-y` invokes minuet-only completions on demand via `make_blink_map()`.

## Switching Models

Change the `model` field in `minuet-ai.lua` to any model loaded in LM Studio. Tested models:

- `mistralai/devstral-small-2-2512` — code-focused FIM model
- `zai-org/glm-4.7-flash` — general purpose, faster inference

You can also switch at runtime: `:Minuet change_model`

## Troubleshooting

- **No completions appearing**: Set `notify = 'debug'` and check `:messages`
- **`:Minuet` command not found**: Plugin isn't loading — check `:Lazy` for errors
- **LM Studio not responding**: Verify `curl http://127.0.0.1:1234/v1/models` returns loaded models
- **Completions slow / only on new lines**: Reduce `n_completions`, `debounce`, `throttle`

## Related Issues

- Epic: nvim-1 (Minuet AI Plugin Setup)
- Tasks: nvim-2 through nvim-6
- nvim-7 (Config optimizations)
