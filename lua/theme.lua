require("themer").setup({
	colorscheme = "darknight",
	transparent = false,
	term_colors = true,
	dim_inactive = true,
	styles = {
		["function"] = { style = "italic" },
		functionBuiltIn = { style = "italic" },
		comment = { style = "bold" },
		constant = { style = "bold" },
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
})
