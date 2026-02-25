return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", ".git" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "standard", -- or "strict"
        autoImportCompletions = true,
      },
    },
  },
}
