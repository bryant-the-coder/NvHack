local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		layout_config = {
			width = 0.75,
			prompt_position = "top",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},

    -- Transparency settings
    --[[ winblend = 25, ]]

		find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
		prompt_prefix = "  ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		file_ignore_patterns = {'__pycache__', 'node_modules', '.jpg', '.jpeg', '.png', '.ico'},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<esc>"] = actions.close,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
	pickers = {
		find_files = {
			prompt_title = " [ FIND FILES ]",
		},
		live_grep = {
			path_display = { "shorten" },
			prompt_title = "並 [ FIND A SPECIFIC LINE ] ",
		},
		file_browser = {
			prompt_title = " [ NVIM-TREE CLONE :D] ",
		},
		colorscheme = {
			prompt_title = " [ CHANGE COLORSCHEME ]",
		},
		oldfiles = {
			prompt_title = " [ GO THROUGH OLDFILES ]",
		},
		keymaps = {
			prompt_title = " [ FIND YOUR KEYMAPS ]",
		},
		current_buffer_fuzzy_find = {
			prompt_title = " [ FIND WORD IN CURRENT FILE ]",
		},
	},
})
