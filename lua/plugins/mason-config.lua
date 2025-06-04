return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- ensure_installed = { "lua-language-server", "docker-compose-language-service", "dockerfile-language-server", "dotenv-linter", "elixir-ls", "html-lsp", "jedi-language-server", "jq", "prettier", "python-lsp-server", "ruff", "typescript-language-server", "yaml-language-server" },
      ensure_installed = {
        "lua_ls",
        "dockerls",
        "elixirls",
        "html",
        "jedi_language_server",
        "pylsp",
        "ts_ls",
        "yamlls",
        "docker_compose_language_service"
      },
      automatic_installation = true
    })
    require("mason-null-ls").setup({
      ensure_installed = { "prettier", "ruff", "jq", "dotenv-linter" },
      automatic_installation = true
    })
  end,
}
