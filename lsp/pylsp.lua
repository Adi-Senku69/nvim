return {
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
