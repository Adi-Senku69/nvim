return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- no changes to opts here unless you want to
    return opts
  end,
  config = function()
    -- Override LSP hover handler to disable automatic hover popups
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded", -- optional border
    })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
  end,
}
