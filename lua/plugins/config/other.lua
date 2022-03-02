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

-- Impatient
require("impatient")
require("impatient").enable_profile()

-- Filetype.nvim
vim.g.did_load_filetypes = 1
