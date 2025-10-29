-- bootstrap lazy.nvim, LazyVim and your plugins
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set mouse=a")
vim.cmd("autocmd TextYankPost * silent! lua vim.hl.on_yank {higroup='Visual', timeout=1300}")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.lsp.enable("ts-ls")
vim.lsp.enable("elixirls")
vim.lsp.enable("yaml-ls")
vim.lsp.enable("luals")
vim.lsp.enable("pylsp")
vim.lsp.enable("dockerls")
vim.lsp.enable("docker-compose-ls")
vim.lsp.enable("cssls_custom")
vim.lsp.enable("html_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("emmet_ls_custom")
-- vim.lsp.enable("asm")
-- Bootstrap lazy.nvim
require("config.lazy")

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or '>>', '', '->', etc.
    spacing = 2,
    severity = nil,
    source = "if_many", -- shows source if multiple sources
    format = function(diagnostic)
      return string.format("%s", diagnostic.message)
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", close_on_exit = true })
vim.keymap.set("n", "<leader>lg", function()
  lazygit:toggle()
end, { desc = "Toggle Lazygit", noremap = true })
