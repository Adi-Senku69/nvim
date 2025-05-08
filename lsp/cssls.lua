local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
return {
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
