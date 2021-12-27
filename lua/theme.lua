local cmd = vim.cmd
local g = vim.g
local o = vim.o

-- Theme
o.termguicolors = true


-- Gruvbox
g.gruvbox_hls_cursor='red'
g.gruvbox_number_column = 'bg0'
g.gruvbox_sign_column = 'bg0'
g.gruvbox_underline = false
g.gruvbox_undercurl = false
-- g.gruvbox_transparent_bg = true
local M = {}
M.tokyonight = function()
  vim.g.tokyonight_dev = true
  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_sidebars = {
    "qf",
    "vista_kind",
    "terminal",
    "packer",
    "spectre_panel",
    "NeogitStatus",
    "help",
  }
  vim.g.tokyonight_cterm_colors = false
  vim.g.tokyonight_terminal_colors = true
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_italic_keywords = true
  vim.g.tokyonight_italic_functions = false
  vim.g.tokyonight_italic_variables = false
  vim.g.tokyonight_hide_inactive_statusline = true
  vim.g.tokyonight_dark_sidebar = true
  vim.g.tokyonight_dark_float = true
  local _time = os.date "*t"
  if _time.hour < 17 then
    vim.g.tokyonight_style = "night"
  end
end
-- Tokyonight
-- g.tokyonight_style = "night"
-- g.tokyonight_italic_comments = false
-- g.tokyonight_italic_keywords = false
-- g.tokyonight_transparent = true
-- g.tokyonight_colors = { bg = "#1c1b26", warning = "#d38b04", hint = "#0064fc", magenta = "#12b385"}


-- Rosepine
g.rose_pine_bold_vertical_split_line = true
g.rose_pine_disable_italics = true

local p = require('rose-pine.palette')
g.rose_pine_colors = {
	punctuation = p.subtle,
	comment = p.subtle,
	hint = p.iris,
	info = p.foam,
	warn = p.gold,
	error = p.love,

	headings = {
		h1 = p.iris,
		h2 = p.foam,
		h3 = p.rose,
		h4 = p.gold,
		h5 = p.pine,
		h6 = p.foam,
	},
}

vim.cmd[[colorscheme tokyonight]]

return M


