-- ABOUTME: Indent-blankline plugin for visual indentation guides (disabled).
-- ABOUTME: Available for re-enabling by setting enabled = true.
return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    enabled = false,
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
}
