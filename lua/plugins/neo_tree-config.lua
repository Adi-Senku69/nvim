return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window
    },
    lazy = false, -- Neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,   -- Show all files, including hidden ones
                hide_dotfiles = false, -- Don't hide dotfiles (e.g., .env, .gitignore)
                hide_gitignored = false, -- Show gitignored files too
            },
            follow_current_file = true, -- Keep current file in view in the tree
        },
        window = {
            position = "left", -- Neo-tree appears on the left by default (can be adjusted)
            width = 30,  -- You can adjust the width of the Neo-tree window
        },
    },
    config = function()
        -- Keybinding to reveal Neo-tree on the right
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
