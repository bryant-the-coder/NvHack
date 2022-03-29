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

-- Theme that i like
-- A) everblush
-- B) UWU
-- C) everforest
-- D) onedark
-- E) gruvchad

local theme
local time = os.date("*t")

-- When its 8am or is equal or more than 9pm = everforest
if time.hour < 7 or time.hour >= 21 then
	theme = "everforest"
else
	theme = "everblush"
end
return base16(base16.themes(theme))
