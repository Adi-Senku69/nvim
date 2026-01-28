return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      typescript = { "eslint_d" },
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
  },
}
