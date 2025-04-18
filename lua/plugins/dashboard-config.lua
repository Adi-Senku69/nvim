return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function()
    --     local startify = require("alpha.themes.startify")
    --     -- available: devicons, mini, default is mini
    --     -- if provider not loaded and enabled is true, it will try to use another provider
    --     startify.file_icons.provider = "devicons"
    --     require("alpha").setup(
    --         startify.config
    --     )
    -- end,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "",
            "⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣶⣶⣤⣄⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢀⣾⡿⠛⠉⠙⠛⠛⠻⣿⣷⣄⠀⠀⠀⠀",
            "⠀⠀⠀⢀⣼⣿⠀⠀𝗇𝖾𝗈𝗏𝗂𝗆⠀⠀⠘⣿⣷⣄⠀⠀",
            "⠀⠀⣰⣿⣿⣧⣤⣀⣀⣀⣤⣴⣾⣿⣿⣿⣷⣤⠀⠀",
            "",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "📄  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "🕘  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("q", "🚪  Quit", ":qa<CR>"),
        }

        dashboard.section.footer.val = {
            "",
            "👨‍💻 Happy coding in Neovim!",
            "🚀 Start something awesome today.",
        }

        dashboard.opts.opts.noautocmd = true

        alpha.setup(dashboard.config)
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                require("neo-tree.command").execute({ toggle = true, position = 'right', dir = vim.loop.cwd() })
                -- Give Neo-tree a moment to open, then redraw alpha to center
                vim.defer_fn(function()
                    -- this triggers alpha to recalculate its layout
                    vim.cmd("AlphaRedraw")
                end, 50)
            end,
        })
    end,
}
