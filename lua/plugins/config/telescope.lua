local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local actions = require("telescope.actions")
local theme = require("telescope.themes")
local load_ext = telescope.load_extension

telescope.load_extension("themes")

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
		-- winblend = 10,

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
		file_ignore_patterns = {
			"__pycache__",
			"node_modules",
			".jpg",
			".jpeg",
			".png",
			".ico",
			".scm",
			".add",
			".add.spl",
		},
		mappings = {
			i = {
				["<TAB>"] = actions.move_selection_next,
				["<S-TAB>"] = actions.move_selection_previous,
				["<esc>"] = actions.close,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

local M = {}

M.find_files = function()
	local opts = {
		-- prompt_title = " [ FIND FILES ]",
		prompt_title = "~ Find Files ~",
		preview_title = "~ File Preview ~",
		results_title = "~ Files ~",
		layout_config = {
			prompt_position = "top",
		},
	}
	require("telescope.builtin").find_files(opts)
end

load_ext("fzf")

M.live_grep = function()
	local opts = {
		preview_title = "~ Location Preview ~ ",
		prompt_title = "~ Find String ~",
		border = true,
		disable_coordinates = true,
		file_ignore_patterns = {
			"vendor/*",
			"node_modules",
			"%.jpg",
			"%.jpeg",
			"%.png",
			"%.svg",
			"%.otf",
			"%.ttf",
		},
	}
	require("telescope.builtin").live_grep(opts)
end

M.diag = function()
	local opts = {
		prompt_title = "~ Diagnostics ~",
		preview_title = "~ Diagnostics Preview ~",
	}
	require("telescope.builtin").diagnostics(opts)
end

return M

-- pickers = {
-- 	find_files = {
-- 		prompt_title = " [ FIND FILES ]",
-- 	},
-- 	live_grep = {
-- 		path_display = { "shorten" },
-- 		prompt_title = "並 [ FIND A SPECIFIC LINE ] ",
-- 	},
-- 	file_browser = {
-- 		prompt_title = " [ NVIM-TREE CLONE :D] ",
-- 	},
-- 	colorscheme = {
-- 		prompt_title = " [ CHANGE COLORSCHEME ]",
-- 	},
-- 	oldfiles = {
-- 		prompt_title = " [ GO THROUGH OLDFILES ]",
-- 	},
-- 	keymaps = {
-- 		prompt_title = " [ FIND YOUR KEYMAPS ]",
-- 	},
-- 	current_buffer_fuzzy_find = {
-- 		prompt_title = " [ FIND WORD IN CURRENT FILE ]",
-- 	},
-- },
