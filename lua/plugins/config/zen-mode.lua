local status_ok, zen = pcall(require, "zen-mode")
if not status_ok then
	return
end

zen.setup({
	window = {
		backdrop = 0.79,
		width = 200, -- width of the Zen window
		options = {
			signcolumn = "yes",
			number = true,
			relativenumber = true, -- disable relative numbers
			cursorline = false, -- disable cursorline
			cursorcolumn = false, -- disable cursor column
			foldcolumn = "0", -- disable fold column
			list = true, -- disable whitespace characters
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
		},
		twilight = { enabled = false },
		gitsigns = { enabled = false },
	},
})
