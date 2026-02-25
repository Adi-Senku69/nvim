-- Keep pylsp but trim it down to formatting/linting only
return {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = { "setup.py", "tox.ini", "requirements.txt", "Pipfile", "pyproject.toml", ".git" },
  settings = {
    pylsp = {
      plugins = {
        -- Disable Jedi entirely
        jedi_completion = { enabled = false },
        jedi_definition = { enabled = false },
        jedi_hover = { enabled = false },
        jedi_references = { enabled = false },
        jedi_signature_help = { enabled = false },
        jedi_symbols = { enabled = false },
        flake8 = { enabled = false }, -- let ruff handle this
        pycodestyle = { enabled = false },
        rope_autoimport = { enabled = false },
        ruff = {
          enabled = true,
          formatEnabled = true,
          extendSelect = { "I" },
          extendIgnore = { "C90" },
          format = { "I" },
          severities = { ["D212"] = "I" },
          unsafeFixes = false,
        },
      },
    },
  },
}
