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
        --     flake8 = {
        --       enabled = true,
        --       ignore = { "W293" },
        --     },
        rope_autoimport = {
          enabled = true,
        },
        -- pycodestyle = {
        --       enabled = false,
        --     },
        Jedi = {
          enable = true,
          completion = {
            brackets = true, -- Enable auto-bracket completions
          },
        },
        -- },
        -- },
        ruff = {
          enabled = true,                  -- Enable the plugin
          formatEnabled = true,            -- Enable formatting using ruffs formatter
          extendSelect = { "I" },          -- Rules that are additionally used by ruff
          extendIgnore = { "C90" },        -- Rules that are additionally ignored by ruff
          format = { "I" },                -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
          severities = { ["D212"] = "I" }, -- Optional table of rules where a custom severity is desired
          unsafeFixes = false,             -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action
        },
      },
    },
  },
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config["cssls"] = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css" },
  root_markers = { ".git", "package.json" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    configurationSelection = { "html", "css", "javascript" },
  },
  capabilities = capabilities,
}
vim.lsp.config["html_ls"] = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { ".html" },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    configurationSelection = { "html", "css", "javascript" },
  },
  capabilities = capabilities,
}
vim.lsp.config["ts-ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript" },
  root_markers = { ".js", ".ts" },
}
vim.lsp.config["yaml-ls"] = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_markers = { ".yaml", ".yml" },
}

vim.lsp.config["docker-compse-ls"] = {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_markers = { ".yaml", ".yml" },
}
vim.lsp.config["dockerls"] = {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile" },
  root_markers = { "Dockerfile", ".dit" },
}
vim.lsp.enable("ts-ls")
vim.lsp.enable("yaml-ls")
vim.lsp.enable("luals")
vim.lsp.enable("pylsp")
vim.lsp.enable("dockerls")
vim.lsp.enable("docker-compse-ls")
vim.lsp.enable("cssls")
vim.lsp.enable("html_ls")
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
