require("themer").setup({
	colorscheme = "darknight", -- default colorscheme
	transparent = false,
	term_colors = true,
	dim_inactive = true,
	styles = {
		["function"] = { style = "italic" },
		functionBuiltIn = { style = "italic" },
		comment = { style = "bold" },
		constant = { style = "bold" },
		number = { style = "italic" },
		diagnostic = {
			underline = {
				error = { style = "underline" },
				warn = { style = "underline" },
			},
			virtual_text = {
				error = { style = "italic" },
				warn = { style = "italic" },
			},
		},
	},
	telescope_mappings = {
		["n"] = {
			["<CR>"] = "enter",
			["k"] = "prev_color",
			["j"] = "next_color",
			["p"] = "preview",
		},
		["i"] = {
			["<CR>"] = "enter",
			["<S-Tab>"] = "prev_color",
			["<Tab>"] = "next_color",
			["<C-p>"] = "preview",
		},
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
