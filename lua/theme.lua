require("themer").setup({
	colorscheme = "darknight", -- default colorscheme
	transparent = false,
	term_colors = true,
	dim_inactive = false,
	styles = {
		heading = {
			h1 = {},
			h2 = {},
		},
		["function"] = { style = "italic" },
		functionBuiltIn = { style = "italic" },
		variable = {},
		variableBuiltIn = {},
		include = {},
		identifier = {},
		keyword = {},
		keywordBuiltIn = {},
		struct = {},
		string = {},
		parameter = {},
		field = {},
		type = {},
		typeBuiltIn = {},
		property = {},
		comment = { style = "italic" },
		punctuation = {},
		constructor = {},
		operator = {},
		constant = {},
		constantBuiltIn = {},
		todo = {},
		character = {},
		conditional = {},
		number = { style = "italic" },
		statement = {},
		uri = {},
		diagnostic = {
			underline = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
			virtual_text = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
		},
	},

	langs = {
		html = true,
		md = true,
	},

	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
		telescope = true,
	},
})
--------------------------------
--      Time Changing Func    --
--------------------------------
-- if time.hour <= 10 then
--   vim.g.gruvbox_hls_cursor='red'
--   vim.g.gruvbox_number_column = 'bg0'
--   vim.g.gruvbox_sign_column = 'bg0'
--   vim.g.gruvbox_underline = false
--   vim.g.gruvbox_undercurl = false
--   vim.cmd[[colorscheme gruvbox]]
-- elseif time.hour <= 18 then
--   vim.g.rose_pine_bold_vertical_split_line = true
--   vim.g.rose_pine_disable_italics = true
--   vim.cmd[[colorscheme rose-pine]]
-- else
--   vim.g.tokyonight_style = "night"
--   vim.g.tokyonight_italic_comments = false
--   vim.g.tokyonight_italic_keywords = false
--   -- vim.g.tokyonight_transparent = true
--   vim.cmd[[colorscheme tokyonight]]
-- local time = os.date("*t")
-- end
