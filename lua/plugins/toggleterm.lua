-- plugins/toggleterm.lua
-- return {
--   "akinsho/toggleterm.nvim",
--   version = "*",
--   event = "VeryLazy",
--   config = function()
--     require("toggleterm").setup({
--       direction = "vertical",
--       size = 60,
--     })
--   end,
--   opts = {
--     direction = "vertical",
--     size = 60
--   },
-- }
--
return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    -- Set the default to vertical:
    direction = "vertical", -- options: "horizontal" | "vertical" | "float" | "window"
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    start_in_insert = true,
    persist_size = true,
    shade_terminals = true,
    close_on_exit = true,
  },
}
