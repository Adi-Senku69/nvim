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
--vim.keymap.set('n', 'q', '@q', {desc = "Record Macros", noremap=true})
vim.lsp.config["luals"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
}

vim.lsp.config["pylsp"] = {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = { "setup.py", "tox.ini", "requirements.txt", "Pipfile", "pyproject.toml", ".git" },
  settings = {
    pylsp = {
      plugins = {
        flake8 = {
          enabled = true,
        },
        rope_autoimport = {
          enabled = true,
        },
      },
    },
  },
}
vim.lsp.config["ts-ls"] = {
  default_config = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript" },
    root_dir = { ".js", ".ts" },
  },
}
vim.lsp.config["yaml-ls"] = {
  default_config = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml" },
    root_dir = { ".yaml", ".yml" },
  },
}
vim.lsp.config["docker-compose-ls"] = {
  default_config = {
    cmd = { "docker-compose-langserver", "--stdio" },
    filetypes = { "yaml" },
    root_dir = { ".yaml", ".yml" },
  },
}
vim.lsp.config["dockerls"] = {
  default_config = {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile" },
    root_dir = { "Dockerfile", ".dit" },
    single_file_support = true,
  },
}
vim.lsp.enable("ts-ls")
vim.lsp.enable("yaml-ls")
vim.lsp.enable("luals")
vim.lsp.enable("pylsp")
vim.lsp.enable("dockerls")
vim.lsp.enable("docker-compse-ls")
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
