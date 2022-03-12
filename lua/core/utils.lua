local M = {}
local cmd = vim.cmd

--- Define bg color
---@param group string
---@param col string
M.bg = function(group, col)
	cmd("hi " .. group .. " guibg=" .. col)
end

--- Define fg color
---@param gruop string
---@param col string
M.fg = function(gruop, col)
	cmd("hi " .. gruop .. " guifg=" .. col)
end

--- Define fg & bg color
---@param group string
---@param fgcol string
---@param bgcol string
M.fg_bg = function(group, fgcol, bgcol)
	cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

M.get = function()
	local theme = "onedark"
	return require("hl_themes." .. theme)
end

M.normal_insert = function(lhs, rhs, opts)
	local default_options = { noremap = true, silent = true }
	if opts then
		default_options = vim.tbl_extend("force", default_options, opts)
	end
	vim.keymap.set({ "n", "i" }, lhs, rhs, default_options)
end
return M
