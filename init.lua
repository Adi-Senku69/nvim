vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set mouse=a")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vim.keymap.set('n', 'q', '@q', {desc = "Record Macros", noremap=true})
vim.keymap.set('n', 'qq', ':q!<CR>', { desc = "To exit from plugins using :q", noremap = true })
vim.keymap.set('n', '<leader>lg', ':!wezterm cli spawn -- lazygit<CR>', { desc = "Spawn Lazygit" })
vim.keymap.set('v', '<leader>c', '"+y', { desc = "Copy file to + register", noremap = true })
vim.keymap.set('v', '<leader>x', '"+d', { desc = "Cut file to + register" })
vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste file to + register" })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
-- Trigger completion manually with <C-Space>
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { noremap = true })

-- Navigate the popup menu
vim.keymap.set('i', '<C-n>', '<C-n>', { noremap = true })
vim.keymap.set('i', '<C-p>', '<C-p>', { noremap = true })

-- Optional: Cancel the menu with <Esc>
vim.keymap.set('i', '<Esc>', '<C-e>', { noremap = true })
      vim.lsp.config['luals'] = {
        -- Command and arguments to start the server.
        cmd = { 'lua-language-server' },

        -- Filetypes to automatically attach to.
        filetypes = { 'lua' },

        -- Sets the "root directory" to the parent directory of the file in the
        -- current buffer that contains either a ".luarc.json" or a
        -- ".luarc.jsonc" file. Files that share a root directory will reuse
        -- the connection to the same LSP server.
        root_markers = { '.luarc.json', '.luarc.jsonc' },

        -- Specific settings to send to the server. The schema for this is
        -- defined by the server. For example the schema for lua-language-server
        -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            }
          }
        }
      }

vim.lsp.enable("luals")
vim.lsp.config['pylsp'] = {
            cmd = {'pylsp'},
            filetypes = {'python'},
            root_markers = { "setup.py", "tox.ini", "requirements.txt", "Pipfile", "pyproject.toml", ".git" }
}
vim.lsp.enable("pylsp")
-- Bootstrap lazy.nvim
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



require("lazy").setup("plugins",
    {
        install = { colorscheme = { "habamax" } },
        -- automatically check for plugin updates
        checker = { enabled = true },
    })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', '<C-Space>', '<C-x><C-o>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set({'n', 'x'}, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {noremap=true})

    vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {noremap=true})
    vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', {noremap=true})
    end, })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({bufnr = args.buf, id = client.id})
        end,
      })
    end
  end,
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/documentHighlight') then
      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup('lsp_highlight', {clear = false})

      vim.api.nvim_clear_autocmds({buffer = bufnr, group = augroup})

      autocmd({'CursorHold'}, {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({'CursorMoved'}, {
        group = augroup,
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess:append('c')

local function tab_complete()
  if vim.fn.pumvisible() == 1 then
    -- navigate to next item in completion menu
    return '<Down>'
  end

  local c = vim.fn.col('.') - 1
  local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')

  if is_whitespace then
    -- insert tab
    return '<Tab>'
  end

  local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'

  if lsp_completion then
    -- trigger lsp code completion
    return '<C-x><C-o>'
  end

  -- suggest words in current buffer
  return '<C-x><C-n>'
end

local function tab_prev()
  if vim.fn.pumvisible() == 1 then
    -- navigate to previous item in completion menu
    return '<Up>'
  end

  -- insert tab
  return '<Tab>'
end

vim.keymap.set('i', '<Tab>', tab_complete, {expr = true})
vim.keymap.set('i', '<S-Tab>', tab_prev, {expr = true})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
  end,
})
