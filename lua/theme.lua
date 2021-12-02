local cmd = vim.cmd
local g = vim.g

-- Tokyonight
g.tokyonight_style = "night"
cmd[[colorscheme tokyonight]]

-- Onedark
g.onedark_style = "deep"

local catppuccin = require("catppuccin")
catppuccin.setup(
    {
		term_colors = true,
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			telescope = true,
			bufferline = false,
		},
	}
)
