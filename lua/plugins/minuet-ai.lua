-- ABOUTME: Minuet AI completion plugin using LM Studio with devstral FIM model.
-- ABOUTME: Provides both blink.cmp source completions and virtual-text inline suggestions.
return {
  'milanglacier/minuet-ai.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('minuet').setup {
      provider = 'openai_fim_compatible',
      -- Throttle and debounce to avoid hammering local LM Studio
      throttle = 500,
      debounce = 200,
      -- Single request for faster local model response
      n_completions = 1,
      notify = 'warn',
      -- Shorter timeout; streaming gives partial results anyway
      request_timeout = 2,
      -- Less context = fewer prompt tokens = faster local inference
      context_window = 8000,
      provider_options = {
        openai_fim_compatible = {
          model = 'mistralai/devstral-small-2-2512',
          end_point = 'http://127.0.0.1:1234/v1/completions',
          api_key = function()
            return 'lm-studio'
          end,
          name = 'LM Studio',
          stream = true,
          optional = {
            -- Keep completions short for inline suggestions
            max_tokens = 100,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { '*' },
        auto_trigger_ignore_ft = {
          'help',
          'gitcommit',
          'gitrebase',
          'TelescopePrompt',
          'lazy',
          'mason',
          'snacks_dashboard',
          'snacks_explorer',
        },
        -- Show ghost text even when blink.cmp menu is open
        show_on_completion_menu = true,
        keymap = {
          accept = '<A-A>',
          accept_line = '<A-a>',
          prev = '<A-[>',
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
    }
  end,
}
