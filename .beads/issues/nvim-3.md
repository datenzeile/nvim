---
id: nvim-3
title: "Configure LM Studio FIM provider"
type: task
priority: 1
status: closed
created: 2026-02-03
updated: 2026-02-03
closed: 2026-02-03
parent: nvim-1
description: "Configure openai_fim_compatible provider pointing at local LM Studio instance"
---

# Configure LM Studio FIM provider

- Set provider to `openai_fim_compatible` (not `openai_compatible` which uses chat endpoint)
- Endpoint: `http://127.0.0.1:1234/v1/completions`
- API key as function returning dummy value (LM Studio doesn't require auth)
- Model: configurable, tested with devstral-small and glm-4.7-flash
