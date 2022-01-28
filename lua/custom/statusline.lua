local fn = vim.fn
local api = vim.api
local M = {}

-- TODOS: Set more modes when i have time and change the coloring

-- Settings mode
M.modes = setmetatable({
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["nov"] = "NORMAL",
	["noV"] = "NORMAL",
	["no"] = "NORMAL",
	["niI"] = "NORMAL",
	["niR"] = "NORMAL",
	["niV"] = "NORMAL",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["ix"] = "INSERT",
	["s"] = "INSERT",
	["S"] = "INSERT",
	["v"] = "VISUAL",
	["V"] = "VISUAL",
	[""] = "VISUAL",
	["r"] = "REPLACE",
	["r?"] = "REPLACE",
	["R"] = "REPLACE",
	["c"] = "COMMAND",
	["t"] = "TERMINAL",
}, {
	__index = function()
		return "Unknown"
	end,
})

-- Getting current mode
M.current_modes = function(self)
	local current_modes = api.nvim_get_mode().mode
	return string.format(" [%s] ", self.modes[current_modes]):upper()
end

-- Git status (gitsigns)
