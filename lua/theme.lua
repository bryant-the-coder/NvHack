require("themer").setup({
	colorscheme = "tokyodark",
	transparent = false,
	term_colors = true,
	dim_inactive = false,
	styles = {
		["function"] = { style = "italic" },
		functionBuiltIn = { style = "italic" },
		comment = { style = "bold" },
		number = { style = "italic" },
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
