-----------------------------------
--           Tokyonight          --
-----------------------------------
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_keywords = false

----------------------------------
--          Tokyodark           --
----------------------------------
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true

-----------------------------------
--           RosePine            --
-----------------------------------
vim.g.rose_pine_disable_italics = false
vim.g.rose_pine_bold_vertical_split_line = true

----------------------------------
--          Kanagawa            --
----------------------------------
require('kanagawa').setup({
  undercurl = true,
  commentStyle = "italic",
  functionStyle = "italic",
  keywordStyle = "NONE",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "NONE",
  specialReturn = true,
  specialException = true,
  transparent = false,
  dimInactive = false,
})

--------------------------------
--         Catppuccin         --
--------------------------------
local catppuccin = require("catppuccin")
catppuccin.setup{
transparent_background = false,
term_colors = true,
styles = {
	comments = "italic",
	functions = "italic",
	keywords = "NONE",
	strings = "NONE",
	variables = "NONE",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "NONE",
			warnings = "italic",
			information = "NONE",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
	lsp_trouble = true,
	cmp = true,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
	},
	indent_blankline = {
		enabled = true,
		colored_indent_levels = true,
	},
	dashboard = true,
	bufferline = true,
	markdown = true,
	ts_rainbow = true,
}
}

vim.cmd([[colorscheme tokyonight]])


--------------------------------
--      Time Changing Func    --
--------------------------------
-- if time.hour <= 10 then
--   vim.g.gruvbox_hls_cursor='red'
--   vim.g.gruvbox_number_column = 'bg0'
--   vim.g.gruvbox_sign_column = 'bg0'
--   vim.g.gruvbox_underline = false
--   vim.g.gruvbox_undercurl = false
--   vim.cmd[[colorscheme gruvbox]]
-- elseif time.hour <= 18 then
--   vim.g.rose_pine_bold_vertical_split_line = true
--   vim.g.rose_pine_disable_italics = true
--   vim.cmd[[colorscheme rose-pine]]
-- else
--   vim.g.tokyonight_style = "night"
--   vim.g.tokyonight_italic_comments = false
--   vim.g.tokyonight_italic_keywords = false
--   -- vim.g.tokyonight_transparent = true
--   vim.cmd[[colorscheme tokyonight]]
-- local time = os.date("*t")
-- end
