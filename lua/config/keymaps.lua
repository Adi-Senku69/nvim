-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
vim.keymap.set("n", "qq", ":q!<CR>", { desc = "To exit from plugins using :q", noremap = true })
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Move window", noremap = true })
vim.keymap.set("n", "<leader>ii", ":!viu %<CR>", { desc = "Display Image" })
vim.keymap.set("n", "<leader>jf", ":%!jq .", { desc = "Format the json file" })
vim.keymap.set("n", "<leader>lp", ":LivePreview start<CR>", { desc = "Live preview of html" })
vim.keymap.set("n", "<leader>lc", ":LivePreview close<CR>", { desc = "Close the Live preview of html" })
vim.keymap.set("v", "<leader>c", '"+y', { desc = "Copy file to + register", noremap = true })
vim.keymap.set("v", "<leader>x", '"+d', { desc = "Cut file to + register" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste file to + register" })
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
-- Trigger completion manually with <C-Space>
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true })

-- Navigate the popup menu
vim.keymap.set("i", "<C-n>", "<C-n>", { noremap = true })
vim.keymap.set("i", "<C-p>", "<C-p>", { noremap = true })

-- Optional: Cancel the menu with <Esc>
vim.keymap.set("i", "<Esc>", "<C-e>", { noremap = true })
vim.keymap.set("n", "<leader>n", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Move to the previous buffer (tab)
vim.keymap.set("n", "<leader>pp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add file to Harpoon" })

vim.keymap.set("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon menu" })

vim.keymap.set("n", "<leader>j", function()
  harpoon:list():select(1)
end, { desc = "Go to Harpoon file 1", noremap = true })

vim.keymap.set("n", "<leader>k", function()
  harpoon:list():select(2)
end, { desc = "Go to Harpoon file 2", noremap = true })

vim.keymap.set("n", "<leader>l", function()
  harpoon:list():select(3)
end, { desc = "Go to Harpoon file 3", noremap = true })

vim.keymap.set("n", "<leader>i", function()
  harpoon:list():select(4)
end, { desc = "Go to Harpoon file 4", noremap = true })

vim.keymap.set("n", "<S-n>", function()
  harpoon:list():next()
end, { desc = "Move to the next file in the buffer" })
vim.keymap.set("n", "<S-p>", function()
  harpoon:list():next()
end, { desc = "Move to the previous file in the buffer" })
vim.keymap.set("n", "<leader>ch", function()
  harpoon:list():clear()
end, { desc = "Clear the harpoon list" })
-- Completion options (ensure you have appropriate completion sources enabled)
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.shortmess:append("c")

local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    -- navigate to next item in completion menu
    return "<Down>"
  end

  local c = vim.fn.col(".") - 1
  local is_whitespace = c == 0 or vim.fn.getline("."):sub(c, c):match("%s")

  if is_whitespace then
    -- insert tab
    return "<Tab>"
  end

  local lsp_completion = vim.bo.omnifunc == "v:lua.vim.lsp.omnifunc"

  if lsp_completion then
    -- trigger lsp code completion
    return "<C-x><C-o>"
  end

  -- suggest words in current buffer
  return "<C-x><C-n>"
end

local function tab_prev()
  if vim.fn.pumvisible() == 1 then
    -- navigate to previous item in completion menu
    return "<Up>"
  end

  -- insert tab
  return "<Tab>"
end

vim.keymap.set("i", "<Tab>", tab_complete, { expr = true })
vim.keymap.set("i", "<S-Tab>", tab_prev, { expr = true })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", "<C-w>d", {})
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.shortmess:append("c")

local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    -- navigate to next item in completion menu
    return "<Down>"
  end

  local c = vim.fn.col(".") - 1
  local is_whitespace = c == 0 or vim.fn.getline("."):sub(c, c):match("%s")

  if is_whitespace then
    -- insert tab
    return "<Tab>"
  end

  local lsp_completion = vim.bo.omnifunc == "v:lua.vim.lsp.omnifunc"

  if lsp_completion then
    -- trigger lsp code completion
    return "<C-x><C-o>"
  end

  -- suggest words in current buffer
  return "<C-x><C-n>"
end

local function tab_prev()
  if vim.fn.pumvisible() == 1 then
    -- navigate to previous item in completion menu
    return "<Up>"
  end

  -- insert tab
  return "<Tab>"
end

vim.keymap.set("i", "<Tab>", tab_complete, { expr = true })
vim.keymap.set("i", "<S-Tab>", tab_prev, { expr = true })
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle vertical terminal" })
vim.keymap.set("i", "<Tab>", tab_complete, { expr = true })
vim.keymap.set("i", "<S-Tab>", tab_prev, { expr = true })
vim.keymap.set("t", "xx", "<cmd>ToggleTerm<cr>", { desc = "Close Terminal" })
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>", { desc = "Remove the search highlight" })
