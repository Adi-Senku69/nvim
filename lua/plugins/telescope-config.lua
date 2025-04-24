return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup {
        defaults = {
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
          file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
            "^.venv/",
            "%.lock$",
            "__pycache__/",
            "%.ropeproject/",
            "%.log$",
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {}
            }
          },
        } }

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>f', function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
        })
      end, { desc = 'Telescope find files' })

      vim.keymap.set('n', '<leader>ag', function()
        builtin.live_grep()
      end, { desc = 'Telescope live grep' })
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
      -- No need to call telescope.setup here again, just load the extension
      require("telescope").load_extension("ui-select")
    end,
  }
}
