-- ABOUTME: Amp plugin from Sourcegraph for AI-assisted coding.
-- ABOUTME: Auto-starts on launch with info-level logging.
return {
  'sourcegraph/amp.nvim',
  branch = 'main',
  lazy = false,
  opts = { auto_start = true, log_level = 'info' },
}
