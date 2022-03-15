local notify = require("notify")
local default = {
	stages = "fade",
	render = "default",
	timeout = 2000,
	background_colour = function()
		local group_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg#")
		if group_bg == "" or group_bg == "none" then
			group_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Float")), "bg#")
			if group_bg == "" or group_bg == "none" then
				return "#000000"
			end
		end
		return group_bg
	end,

	minimum_width = 50,
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
}

notify.setup(default)

vim.notify = function(msg, level, opts)
	notify(msg, level, opts)
end

vim.notify = require("notify")
-- There is a notify in autocommand.lua & handlers.lua
