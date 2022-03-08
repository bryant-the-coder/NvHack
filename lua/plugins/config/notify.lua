local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	stages = "fade",
	on_open = nil,
	on_close = nil,
	render = "minimal",
	timeout = 4500,
	max_width = nil,
	max_height = nil,
	background_colour = "Normal",
	minimum_width = 60,
	icons = {
		ERROR = " ",
		WARN = " ",
		INFO = " ",
		DEBUG = " ",
		TRACE = "✎ ",
	},
})

-- There is a notify in autocommand.lua & handlers.lua
