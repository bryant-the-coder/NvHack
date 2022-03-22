-- require("themer").setup({
-- 	colorscheme = "gruvchad",
-- 	transparent = false,
-- 	disable_telescope_themes = { "ayu", "rose_pine_dawn" },
-- 	term_colors = true,
-- 	dim_inactive = false,
-- 	styles = {
-- 		["function"] = { italic = true },
-- 		functionBuiltIn = { italic = true },
-- 		comment = { italic = true, bold = true },
-- 		number = { italic = true },
-- 		constant = { bold = true },
-- 		diagnostic = {
-- 			underline = {
-- 				error = { underline = true },
-- 				warn = { underline = true },
-- 			},
-- 			virtual_text = {
-- 				error = { italic = true },
-- 				warn = { italic = true },
-- 			},
-- 		},
-- 	},
-- })

local base16 = require("base16")
base16(base16.themes("everforest"))

local theme
local time = os.date("*t")
if time.hour < 8 or time.hour >= 21 then
	theme = "onedark"
else
	theme = "everforest"
end
return base16(base16.themes(theme))
