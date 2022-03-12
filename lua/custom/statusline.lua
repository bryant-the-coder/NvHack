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

-- Filename {{{
local function filename()
	local fname = fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return " " .. fname .. " "
end

-- local modified = function()
-- 	if vim.bo.modified then
-- 		if vim.bo.readonly then
-- 			return "[-]"
-- 		end
-- 		return "[+]"
-- 	end
-- 	return ""
-- end

local readonly = function()
	if vim.bo.readonly then
		return "RO"
	end
	return ""
end

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

-- LSP that didnt show up {{{
-- local fmt = string.format
-- local function get_diagnostic(prefix, severity)
-- 	local count
-- 	if vim.fn.has("nvim-0.6") == 0 then
-- 		count = vim.lsp.diagnostic.get_count(0, severity)
-- 	else
-- 		local severities = {
-- 			["Warning"] = vim.diagnostic.severity.WARN,
-- 			["Error"] = vim.diagnostic.severity.ERROR,
-- 		}
-- 		count = #vim.diagnostic.get(0, { severity = severities[severity] })
-- 	end
-- 	if count < 1 then
-- 		return ""
-- 	end
-- 	return fmt("%s:%d", prefix, count)
-- end

-- local function get_error()
-- 	return get_diagnostic("E", "Error")
-- end

-- local function get_warning()
-- 	return get_diagnostic(" W", "Warning")
-- end
-- }}}

-- Clock {{{
local function clock()
	return "羽 " .. os.date("%H:%M ")
end
--}}}

-- LSP {{{
local error = function()
	local result = {}
	local levels = {
		errors = "Error",
	}

	for k, level in pairs(levels) do
		result[k] = vim.lsp.diagnostic.get_count(0, level)
	end

	return string.format(" E:%s ", result["errors"] or 0)
end

local warning = function()
	local result = {}
	local levels = {
		errors = "Error",
	}

	for k, level in pairs(levels) do
		result[k] = vim.lsp.diagnostic.get_count(0, level)
	end

	return string.format(" W:%s ", result["warnings"] or 0)
end
-- }}}

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
		-- modified(), -- Modified filetype
		readonly(), -- Readonly filetype
		"%#Normal#",
		"%=",
		"%#Error#",
		error(),
		"%#Normal#",
		"%#Warning#",
		warning(),
		"%#Clock#",
		clock(),
	})
end

function Statusline.inactive()
	return table.concat({
		"%#StatusInactive#",
		"%=",
		filename(),
		readonly(),
		"%=",
	})
end

function Statusline.short()
	return "%#StatusLineNC#   NvimTree"
end

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
