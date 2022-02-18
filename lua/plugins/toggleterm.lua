local present, toggleterm = pcall(require, "toggleterm")
if not present then
	return
end

--This is for custom command
local Terminal = require('toggleterm.terminal').Terminal


toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminals = false,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe",
	float_opts = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		winblend = 5,
		highlights = {
			border = "FloatBorder",
			background = "NormalFloat",
		},
		height = 50,
	},
})


-- Custom command
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end
