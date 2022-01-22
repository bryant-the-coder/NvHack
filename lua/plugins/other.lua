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

-- indent_blankline
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
}
