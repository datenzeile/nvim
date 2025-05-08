return {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 30,
        side = 'left',
      },
      filters = {
        dotfiles = true,
      },
    }
    -- Nvim-tree shortcut
    vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
