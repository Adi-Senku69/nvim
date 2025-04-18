return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,         -- Show hidden files
                    hide_dotfiles = false,  -- Do not hide dotfiles
                    hide_gitignored = false -- Optional: show gitignored files
                },
                follow_current_file = {
                    enabled = true
                },
            },
            window = {
                position = "left",
                width = 30,
                mappings = {
                    ["H"] = "toggle_hidden", -- Optional: toggle dotfiles with 'H'
                },
            },
        })

        -- Keybinding to open Neo-tree on the right
        vim.keymap.set('n', '<C-f>', ':Neotree filesystem reveal right<CR>', { desc = 'Reveal filesystem on the right' })

        -- Auto-close Neo-tree after opening a file
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            callback = function()
                if vim.bo.filetype ~= "neo-tree" then
                    require("neo-tree.command").execute({ action = "close" })
                end
            end,
        })
    end,
}
