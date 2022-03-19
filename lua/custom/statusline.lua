local fn = vim.fn
local api = vim.api

--Modes {{{
local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

local function mode()
	local current_mode = api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
	local current_mode = api.nvim_get_mode().mode
	local mode_color = "%#StatusLineAccent#"
	if current_mode == "n" then
		mode_color = "%#StatusNormal#"
	elseif current_mode == "i" or current_mode == "ic" then
		mode_color = "%#StatusInsert#"
	elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
		mode_color = "%#StatusVisual#"
	elseif current_mode == "R" then
		mode_color = "%#StatusReplace#"
	elseif current_mode == "c" then
		mode_color = "%#StatusCommand#"
	elseif current_mode == "t" then
		mode_color = "%#StatusTerminal#"
	end
	return mode_color
end
--}}}

-- Git Branch {{{
local vcs = function()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	return table.concat({
		"%#Branch#  ",
		git_info.head,
		" ",
	})
end
-- }}}

-- LSP {{{
local fmt = string.format

--- Getting diagnostic
---@param prefix string Which is W as in warning
---@param severity number
---@return string W:1
local function get_diagnostic(prefix, severity)
	local count
	if vim.fn.has("nvim-0.6") == 0 then
		count = vim.lsp.diagnostic.get_count(0, severity)
	else
		local severities = {
			["Warning"] = vim.diagnostic.severity.WARN,
			["Error"] = vim.diagnostic.severity.ERROR,
			["Info"] = vim.diagnostic.severity.INFO,
			["Hint"] = vim.diagnostic.severity.HINT,
		}
		count = #vim.diagnostic.get(0, { severity = severities[severity] })
	end
	return fmt(" %s:%d ", prefix, count)
end

local function get_error()
	return get_diagnostic("X", "Error")
end
local function get_warning()
	return get_diagnostic("W", "Warning")
end
-- local function get_info()
-- 	return get_diagnostic("I", "Info")
-- end
-- local function get_hint()
-- 	return get_diagnostic("H", "Hint")
-- end
-- }}}

-- Clock {{{
local function clock()
	return " 什 " .. os.date("%H:%M ")
end
--}}}

-- Filename {{{
local function get_name()
	local fname = fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return " " .. fname .. " "
end

local function get_readonly()
	if vim.bo.readonly then
		return "[RO]"
	end
	return ""
end

local function get_modified()
	if vim.bo.modified then
		return "[+]"
	end
	if not vim.bo.modifiable then
		return "[-]"
	end
	return ""
end

local function filename()
	local name = get_name()
	local flags = table.concat({ get_readonly(), get_modified() })
	if flags ~= "" then
		flags = " " .. flags
	end
	return table.concat({ name, flags })
end
-- }}}

-- local function get_file_icon(filename, ext)
-- 	local status, icons = pcall(require, "nvim-web-devicons")
-- 	if not status then
-- 		return
-- 	end
-- 	return icons.get_icon(filename, ext, { default = true })
-- end

-- local function file_icon(filename, extension)
-- 	require("nvim-web-devicons").get_icon(filename, extension, { default = true })
-- end

-- Main content {{{
Statusline = {}

Statusline.active = function()
	return table.concat({
		"%#Statusline#",
		update_mode_colors(), -- Update mode colors
		mode(), -- Show mode
		"%#Normal#",
		vcs(),
		"%#Filename#",
		filename(), -- Show filename
		"%#Normal#",
		"%=",
		"%#Error#",
		get_error(),
		"%#Normal#",
		"%#Warning#",
		get_warning(),
		"%#Clock#",
		clock(),
	})
end

function Statusline.inactive()
	return table.concat({
		"%#StatusInactive#",
		"%=",
		filename(),

		"%=",
	})
end

function Statusline.short()
	return "%#StatusLineNC#   NvimTree"
end
-- }}}

api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]],
	false
)
