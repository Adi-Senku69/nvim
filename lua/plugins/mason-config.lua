return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "dockerls",
        "elixirls",
        "html",
        "jedi_language_server",
        "pylsp",
        "ts_ls",
        "yamlls",
        "docker_compose_language_service",
        "clangd",
        "cssls",
        "emmet_language_server",
        "bashls",
      },
      automatic_installation = false,
    })
    require("mason-null-ls").setup({
      ensure_installed = { "prettier", "ruff", "jq", "dotenv-linter", "shfmt" },
      automatic_installation = false,
    })
  end,
}
