local g = vim.g
local fn = vim.fn

local plugins_count = fn.len(fn.globpath("$HOME/AppData/Local/nvim-data/site/pack/packer/start/", "*", 0, 1))
local datetime = os.date "%d-%m-%Y"

g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

-- g.dashboard_custom_header = {
-- 	"                                                       ",
-- 	"███╗   ██╗██╗   ██╗    ██╗  ██╗ █████╗  ██████╗██╗  ██╗",
-- 	"████╗  ██║██║   ██║    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝",
-- 	"██╔██╗ ██║██║   ██║    ███████║███████║██║     █████╔╝ ",
-- 	"██║╚██╗██║╚██╗ ██╔╝    ██╔══██║██╔══██║██║     ██╔═██╗ ",
-- 	"██║ ╚████║ ╚████╔╝     ██║  ██║██║  ██║╚██████╗██║  ██╗",
-- 	"╚═╝  ╚═══╝  ╚═══╝      ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝",
-- 	"                                                       ",
-- }

g.dashboard_custom_header = {
  "                                                        ",
  " ███    ██ ██    ██ ██   ██  █████   ██████ ██   ██     ",
  " ████   ██ ██    ██ ██   ██ ██   ██ ██      ██  ██      ",
  " ██ ██  ██ ██    ██ ███████ ███████ ██      █████       ",
  " ██  ██ ██  ██  ██  ██   ██ ██   ██ ██      ██  ██      ",
  " ██   ████   ████   ██   ██ ██   ██  ██████ ██   ██     ",
  "                                                       ",
}

g.dashboard_custom_section = {
  a = { description = { "  Find File                SPC f f" }, command = "Telescope find_files" },
  b = { description = { "  Find Word                SPC f w" }, command = "Telescope live_grep" },
  c = { description = { "ﲉ  Find Help                SPC f h" }, command = "Telescope help_tags" },
  d = { description = { "  Colorschemes             SPC f c" }, command = "Telescope colorscheme" },
  e = { description = { "  Find Keymaps             SPC f k" }, command = "Telescope keymaps" },
}

g.dashboard_custom_footer = {
  -- "┌─ Today is " .. datetime .. " ─┐",
  -- "└─ " .. plugins_count .. " plugins in total ─┘",
  " ",
  "NvHack loaded " .. plugins_count .. " plugins successfully!",
}
