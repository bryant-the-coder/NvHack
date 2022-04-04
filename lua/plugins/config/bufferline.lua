local present, bufferline = pcall(require, "bufferline")
if not present then
	return
end

local default = {
	colors = require("core.utils").get(),
}
local groups = require("bufferline.groups")
local fn = vim.fn
-- Code from NvChad
bufferline.setup({
	options = {
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "sbuffer %d",
		middle_mouse_command = "vertical sbuffer %d",
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		view = "multiwindow",
		diagnostics = "nvim_diagnostic",
		diagnostics_update_in_insert = true,
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	return "(" .. count .. ")"
		-- end,
		offsets = { { filetype = "NvimTree", text = "" } },
		separator_style = "padded_slant",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
	highlights = {
		background = {
			guifg = default.colors.grey_fg,
			guibg = default.colors.black2,
			-- guibg = default.colors.black,
		},

		-- buffers
		buffer_selected = {
			guifg = default.colors.white,
			guibg = default.colors.grey,
			-- guibg = default.colors.black,
			gui = "bold,italic",
		},

		duplicate_selected = {
			guifg = default.colors.white,
			-- guibg = default.colors.black,
			guibg = default.colors.grey,
			gui = "bold,italic",
		},
		duplicate_visible = {
			guifg = default.colors.white,
			guibg = default.colors.black2,
			gui = "bold,italic",
		},
		buffer_visible = {
			guifg = default.colors.white,
			-- guibg = default.colors.black2,
			guibg = default.colors.black2,
		},

		buffer = {
			guifg = default.colors.white,
			-- guibg = default.colors.black2,
			guibg = default.colors.black2,
		},

		-- for diagnostics = "nvim_lsp"
		error = {
			guifg = default.colors.light_grey,
			guibg = default.colors.black2,
		},
		error_diagnostic = {
			guifg = default.colors.light_grey,
			guibg = default.colors.black2,
		},

		-- close buttons
		close_button = {
			guifg = default.colors.light_grey,
			guibg = default.colors.black2,
		},
		close_button_visible = {
			guifg = default.colors.light_grey,
			guibg = default.colors.black2,
		},
		close_button_selected = {
			guifg = default.colors.red,
			guibg = default.colors.grey,
		},
		fill = {
			guifg = default.colors.grey,
			guibg = default.colors.darker_black,
		},
		indicator_selected = {
			guifg = default.colors.black2,
			guibg = default.colors.black,
		},

		-- modified
		modified = {
			guifg = default.colors.red,
			guibg = default.colors.black2,
		},
		modified_visible = {
			guifg = default.colors.red,
			guibg = default.colors.black2,
		},
		modified_selected = {
			guifg = default.colors.green,
			guibg = default.colors.grey,
		},

		-- separators
		separator = {
			-- guifg = default.colors.green,
			-- guifg = "",
			guifg = default.colors.darker_black,
			guibg = default.colors.black2,
		},
		separator_visible = {
			-- guifg = default.colors.green,
			guifg = default.colors.darker_black,
			guibg = default.colors.black2,
		},
		separator_selected = {
			-- guifg = default.colors.green,
			guifg = default.colors.darker_black,
			guibg = default.colors.grey,
		},

		-- tabs
		tab = {
			guifg = default.colors.light_grey,
			guibg = default.colors.one_bg3,
		},
		duplicate = {
			guifg = default.colors.light_grey,
			guibg = default.colors.black2,
		},
		tab_selected = {
			guifg = default.colors.black2,
			guibg = default.colors.nord_blue,
		},
		tab_close = {
			guifg = default.colors.red,
			guibg = default.colors.darker_black,
		},
	},
})
