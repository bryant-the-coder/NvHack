-- Colorizer
require("colorizer").setup({
	"css",
	"scss",
	"javascript",
	"typescript",
	"html",
	"lua",
})

DEFAULT_OPTIONS = {
	RGB = true,
	RRGGBB = true,
	names = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
	mode = "background",
}

-- lsp-colors
require("lsp-colors").setup({
	Error = "#EE4B2B",
	Warning = "#d9ff00",
	Information = "#08f7ff",
	Hint = "#00ff00",
})

-- Impatient
require("impatient")
require("impatient").enable_profile()

-- Filetype.nvim
vim.g.did_load_filetypes = 1
