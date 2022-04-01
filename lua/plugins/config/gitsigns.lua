local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "▍",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "▍",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "▸",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "▾",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "▍",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "  : <author> | <author_time:%m-%d-%Y | %X> | <summary>",
})

-- vim.cmd([[
--     highlight GitSignsAdd guifg=#9ece6a
--     highlight GitSignsChange guifg=#d39b47
--     highlight GitSignsDelete guifg=#d63131
--     highlight GitSignsCurrentLineBlame guifg=#FFFFFF
-- ]])
