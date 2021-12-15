local cmd = vim.cmd
local g = vim.g
local o = vim.o


-- Theme
o.termguicolors = true


-- Gruvbox
g.gruvbox_hls_cursor='red'
g.gruvbox_contrast_dark = 'medium'
g.gruvbox_number_column = 'bg0'
g.gruvbox_sign_column = 'bg0'
g.gruvbox_underline = false
g.gruvbox_undercurl = false


-- Tokyonight
g.tokyonight_style = "night"
g.tokyonight_italic_comments = false
g.tokyonight_italic_keywords = false
-- g.tokyonight_colors = { bg = "#1c1b26", warning = "#d38b04", hint = "#0064fc", magenta = "#12b385"}


cmd[[colorscheme tokyonight]]
