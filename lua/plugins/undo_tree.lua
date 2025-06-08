return {
  -- Tree-based (Lua)
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('undotree').setup({ float_diff = true })
      vim.keymap.set('n', '<leader>uj', require('undotree').toggle, { desc = "Undo Tree" })
    end,
  },

  -- Fuzzy search
  {
    'debugloop/telescope-undo.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup {
        extensions = { undo = {} }
      }
      require('telescope').load_extension('undo')
      vim.keymap.set('n', '<leader>uu', '<cmd>Telescope undo<cr>')
    end,
  },
}
