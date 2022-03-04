-- require("themer").setup({
-- 	colorscheme = "astron",
-- 	transparent = false,
-- 	disable_telescope_themes = { "ayu", "rose_pine_dawn" },
-- 	term_colors = true,
-- 	dim_inactive = false,
-- 	styles = {
-- 		["function"] = { style = "italic" },
-- 		functionBuiltIn = { style = "italic" },
-- 		comment = { style = "italic,bold" },
-- 		number = { style = "italic" },
-- 		constant = { style = "bold" },
-- 		diagnostic = {
-- 			underline = {
-- 				error = { style = "underline" },
-- 				warn = { style = "underline" },
-- 			},
-- 			virtual_text = {
-- 				error = { style = "italic" },
-- 				warn = { style = "italic" },
-- 			},
-- 		},
-- 	},
-- })

local base16 = require("base16")
base16(base16.themes("gruvchad"), true)
