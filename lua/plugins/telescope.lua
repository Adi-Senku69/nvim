return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/*",
            "--glob=!node_modules/*",
            "--glob=!*.log",
            "--glob=!*.lock",
            "--glob=!*.venv",
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
              require("telescope.themes").get_dropdown({}),
            },
          },
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>f", function()
        builtin.find_files({
          hidden = false,
          no_ignore = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
        })
      end, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader><leader>", function()
        builtin.find_files({
          hidden = false,
          no_ignore = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
        })
      end, { noremap = true, desc = "Telescope find files" })

      vim.keymap.set("n", "<leader>ag", function()
        builtin.live_grep({ no_ignore = false })
      end, { desc = "Telescope live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- No need to call telescope.setup here again, just load the extension
      require("telescope").load_extension("ui-select")
    end,
  },
}
