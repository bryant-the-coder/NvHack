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


cmd[[colorscheme nord]]
