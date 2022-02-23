local fn = vim.fn
local api = vim.api
local M = {}
local padding = " "
local center = "%="
local right_sep = ""
local left_sep = ""

M.colors = {
	active = "%#StatusLine#",
	inactive = "%#StatuslineNC#",
	mode = "%#Mode#",
	git = "%#Git#",
	filetype = "%#Filetype#",
}

--- Setting highlights options
---@param group string
---@param options string
local set_hl = function(group, options)
	local bg = options.bg == nil and "" or "guibg=" .. options.bg
	local fg = options.fg == nil and "" or "guifg=" .. options.fg
	local gui = options.gui == nil and "" or "gui=" .. options.gui

	vim.cmd(string.format("hi %s %s %s %s", group, bg, fg, gui))
end

-- you can of course pick whatever colour you want, I picked these colours
-- because I use Gruvbox and I like them
local highlights = {
	{ "StatusLine", { fg = "#15171c", bg = "#dedede" } },
	{ "StatusLineNC", { fg = "#3C3836", bg = "#928374" } },
	{ "Mode", { bg = "#928374", fg = "#1D2021", gui = "italic,bold" } },
	{ "Git", { bg = "#504945", fg = "#FFFFFF" } },
	{ "Filename", { bg = "#504945", fg = "#EBDBB2" } },
}

for _, highlight in ipairs(highlights) do
	set_hl(highlight[1], highlight[2])
end

--- Setting the length of each characters
---@return boolean
M.trunc_width = setmetatable({
	git_status = 20,
	filename = 50,
}, {
	__index = function()
		return 80
	end,
})

-- Works with the above func
M.is_truncated = function(_, width)
	local current_width = api.nvim_win_get_width(0)
	return current_width < width
end

--- Shows mode in statusline
---@return string
M.modes = setmetatable({
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["nov"] = "NORMAL",
	["noV"] = "NORMAL",
	["no"] = "NORMAL",
	["niI"] = "NORMAL",
	["niR"] = "NORMAL",
	["niV"] = "NORMAL",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["ix"] = "INSERT",
	["s"] = "INSERT",
	["S"] = "INSERT",
	["v"] = "VISUAL",
	["V"] = "VISUAL",
	[""] = "VISUAL",
	["r"] = "REPLACE",
	["r?"] = "REPLACE",
	["R"] = "REPLACE",
	["c"] = "COMMAND",
	["t"] = "TERMINAL",
}, {
	__index = function()
		return "Unknown"
	end,
})

---Return current modes
---@param self string
---@return string
M.current_modes = function(self)
	local current_modes = api.nvim_get_mode().mode
	return string.format(" %s ", self.modes[current_modes]):upper()
end

---Git status
---@param self function
---@return string
M.git_status = function(self)
	local signs = vim.b.gitsigns_status_dict or { head = "", added = 0, changed = 0, removed = 0 }
	local is_head_empty = signs.head ~= ""

	if self:is_truncated(self.trunc_width.git_status) then
		return is_head_empty and string.format("  %s ", signs.head or "") or ""
	end

	return is_head_empty and string.format(" שׂ %s ", signs.head) or ""
end

---Getting filename
---@return osdate
M.filename = function()
	---Getting filename
	local filename = fn.expand("%:t")
	return filename == "" and "" or filename
end

---LSP diagnostic
---@return function
M.lsp_diagnostics = function()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	return string.format("%s:E %s:W ", count["errors"] or 0, count["warnings"] or 0)
end

---Creating a clock
---@return function
M.clock = function()
	return os.date(" %a | %H:%M:%S ")
end

--- Show active statusline
---@param self boolean
---@return boolean
M.set_active = function(self)
	local colors = self.colors
	local mode = colors.mode .. self:current_modes()
	local git = colors.git .. self:git_status()

	return table.concat({
		colors.active,
		mode,
		right_sep,
		padding,
		git,
		center,
		self:filename(),
		center,
		self:lsp_diagnostics(),
		padding,
		left_sep,
		padding,
		self:clock(),
	})
end

---Setting inactive statusline
---@param self function
---@return boolean
M.set_inactive = function(self)
	return table.concat({
		center,
		self:filename(),
		center,
	})
end

--- Show nvimtree
---@return string
M.set_explorer = function()
	return table.concat({
		"%=",
		" NVIMTREE",
		"%=",
	})
end

Statusline = setmetatable(M, {
	__call = function(self, mode)
		return self["set_" .. mode](self)
	end,
})

vim.cmd([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]])
