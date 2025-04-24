local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    -- optional extras (if using alpha dashboard)
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        opts.section.header.val = {
          [[        █████╗ ██╗   ██╗██╗███╗   ███╗]],
          [[       ██╔══██╗██║   ██║██║████╗ ████║]],
          [[       ███████║██║   ██║██║██╔████╔██║]],
          [[       ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
          [[       ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
          [[       ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          [[             Welcome to AVim 🚀     ]],
        }
        opts.section.header.opts.position = "center"
      end,
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      keys = function()
        -- This overrides LazyVim’s default keymaps
        return {
          -- Your custom mappings go here
          {
            "<leader>a",
            function()
              require("harpoon"):list():add()
            end,
            desc = "Add file to Harpoon",
          },
          {
            "<leader>h",
            function()
              require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Toggle Harpoon menu",
          },
          {
            "<leader>j",
            function()
              require("harpoon"):list():select(1)
            end,
            desc = "Go to Harpoon file 1",
          },
          {
            "<leader>k",
            function()
              require("harpoon"):list():select(2)
            end,
            desc = "Go to Harpoon file 2",
          },
          {
            "<leader>l",
            function()
              require("harpoon"):list():select(3)
            end,
            desc = "Go to Harpoon file 3",
          },
          {
            "<leader>i",
            function()
              require("harpoon"):list():select(4)
            end,
            desc = "Go to Harpoon file 4",
          },
          {
            "<S-n>",
            function()
              require("harpoon"):list():next()
            end,
            desc = "Move to next Harpoon file",
          },
          {
            "<S-p>",
            function()
              require("harpoon"):list():prev()
            end,
            desc = "Move to previous Harpoon file",
          },
          {
            "<leader>ch",
            function()
              require("harpoon"):list():clear()
            end,
            desc = "Clear Harpoon list",
          },
        }
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
