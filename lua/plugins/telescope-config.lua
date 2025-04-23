return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>ag', builtin.live_grep, { desc = 'Telescope live grep' })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "lua", "vim", "javascript", "html", "python", "css", "json5" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup {
        defaults = {
          -- Applies to all pickers (like live_grep, find_files, etc.)
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--no-ignore',
            '--glob', '!.git/*',
            '--glob', '!node_modules/*',
            '--glob', '!*.log',
            '--glob', '!*.lock',
            '--glob', '!*.venv',
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      -- require("telescope").setup {
      --   extensions = {
      --     ["ui-select"] = {
      --       require("telescope.themes").get_dropdown {
      --         -- even more opts
      --       }
      --     }
      --   }
      -- }
      require("telescope").load_extension("ui-select")
    end
  }
}
