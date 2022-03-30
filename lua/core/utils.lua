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

--- Getting color from base16
-- Theme that i like
-- A) everblush
-- B) UWU
-- C) everforest
-- D) onedark
-- E) gruvchad
M.get = function()
	local theme
	local time = os.date("*t")
	if time.hour < 7 or time.hour >= 21 then
		theme = "everforest"
	else
		theme = "everblush"
	end
	return require("hl_themes." .. theme)
end

--- Go to url
---@param cmd thread https://github.com
M.url = function(cmd)
	local url = vim.api.nvim_get_current_line():match([[%[.*]%((.*)%)]]) -- To work on md links
	if url == nil then
		url = vim.fn.expand("<cWORD>")
		if not string.match(url, "http") then
			url = "https://github.com/" .. url
		end
		if string.match(url, [[(.+)[,:]$]]) then
			url = url:sub(1, -2)
		end -- to check commas at the end
	end

	vim.notify("Going to " .. url, "info", { title = "Opening browser..." })
	vim.cmd(":silent !" .. cmd .. " " .. url)
	-- vim.cmd(':silent !'..(cmd or "xdg-open")..' '..url..' 1>/dev/null')
end

M.swap_boolean = function()
	local c = vim.api.nvim_get_current_line()
	local subs = c:match("true") and c:gsub("true", "false") or c:gsub("false", "true")
	vim.api.nvim_set_current_line(subs)
end

return M
