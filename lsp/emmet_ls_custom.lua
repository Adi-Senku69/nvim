local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { "emmet-language-server", "--stdio" },
  capabilities = capabilities,
  filetypes = {
    "html", "css", "scss", "sass", "less",
    "javascript", "javascriptreact", "typescriptreact",
    "pug", "eruby", "xml", "vue", "php", "svelte"
  },
  init_options = {
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
    preferences = {},
    syntaxProfiles = {},
    variables = {},
  },
}
