local fn = vim.fn
local api = vim.api

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

local function filename()
	local fname = fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return fname .. " "
end

local vcs = function()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	return table.concat({
		" ",
		"%#Branch# ",
		git_info.head,
		" %#Normal#",
	})
end

local modified = function()
	if vim.bo.modified then
		if vim.bo.readonly then
			return "[-]"
		end
		return "[+]"
	end
	return ""
end

local readonly = function()
	if vim.bo.readonly then
		return "RO"
	end
	return ""
end

local function lsp()
	local count = {}
	local space = " "
	local levels = {
		errors = "Error",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local errors = ""

	if count["errors"] ~= 0 then
		errors = " %#LspDiagnosticsSignError# " .. count["errors"]
	end

	return errors .. space .. "%#Error#"
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		"%#Statusline#",
		update_mode_colors(), -- Update mode colors
		mode(), -- Show mode
		"%#Normal#",
		vcs(), -- Git branch info
		"%=",
		filename(), -- Show filename
		modified(), -- Modified filetype
		readonly(), -- Readonly filetype
		"%=%#StatusLineExtra#",
		lsp(),
	})
end

function Statusline.inactive()
	return table.concat({
		"%#StatusInactive#",
		"%=",
		filename(),
		modified(),
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
