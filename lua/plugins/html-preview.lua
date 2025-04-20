local socket = require("socket")

local function is_port_in_use(port)
  local tcp = socket.tcp()
  local success, _ = tcp:bind("127.0.0.1", port)
  tcp:close()
  return not success
end

local function find_available_port(start_port)
  local port = start_port
  while is_port_in_use(port) do
    port = port + 1
  end
  return port
end

local base_port = 5500
local available_port = find_available_port(base_port)

return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    -- You can choose one of the following pickers
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("livepreview.config").set({
      port = available_port,
    })
  end,
}
