local status_ok, heirline = pcall(require, "heirline")
if not status_ok then
	return
end
local utilities = require("heirline.utils")
local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local align = { provider = "%=" }
local space = { " " }

local use_dev_icons = false

local highlights = {
	fg = "#abb2bf",
	bg = "#262930",
	red = "#f2525f",
	orange = "#ff9640",
	yellow = "#edbf6a",
	cyan = "#55d6cf",
	green = "#b2ff00",
	purple = "#c678dd",
	white = "#fcfcfc ",
}

-- Defining own icons
-- Code from max397574
local file_icons = {
	typescript = " ",
	ts = " ",
	python = " ",
	py = " ",
	java = " ",
	html = " ",
	css = " ",
	scss = " ",
	javascript = " ",
	js = " ",
	javascriptreact = " ",
	markdown = " ",
	md = " ",
	sh = " ",
	zsh = " ",
	vim = " ",
	rust = " ",
	rs = " ",
	cpp = " ",
	c = " ",
	go = " ",
	lua = " ",
	conf = " ",
	haskel = " ",
	hs = " ",
	ruby = " ",
	txt = " ",
}

local mode = {
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	static = {
		mode_details = {
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
		},
		mode_highlights = {
			n = highlights.white,
			i = highlights.green,
			v = highlights.cyan,
			V = highlights.cyan,
			["^V"] = highlights.cyan,
			c = highlights.orange,
			s = highlights.red,
			S = highlights.red,
			["^S"] = highlights.red,
			R = highlights.orange,
			r = highlights.orange,
			["!"] = highlights.purple,
			t = highlights.purple,
		},
	},
	provider = function(self)
		return "%2(" .. self.mode_details[self.mode] .. "%)"
	end,
	-- Same goes for the highlight. Now the foreground will change according to the current mode.
	hl = function(self)
		local mode = self.mode:sub(1, 1) -- get only the first mode character
		return { fg = self.mode_highlights[mode], style = "bold" }
	end,
}

local FileNameBlock = {
	-- let's first set up some attributes needed by this component and it's children
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}
-- We can now define some children separately and add them later

local FileIcon = {
	init = function(self)
		self.mode = vim.fn.mode(1)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		if use_dev_icons then
			self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
		else
			self.icon = file_icons[extension] or ""
		end
	end,
	provider = function(self)
		return self.icon and (" " .. self.icon)
	end,
	hl = function(self)
		if use_dev_icons then
			return { fg = self.icon_color }
		else
			local mode = self.mode:sub(1, 1) -- get only the first mode character
			return { fg = highlights.fg }
		end
	end,
}

local FileName = {
	provider = function(self)
		-- first, trim the pattern relative to the current directory. For other
		-- options, see :h filename-modifers
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		-- now, if the filename would occupy more than 1/4th of the available
		-- space, we trim the file path to its initials
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = { fg = highlights.purple },
}

local FileFlags = {
	{
		provider = function()
			if vim.bo.modified then
				return "[+]"
			end
		end,
		hl = { fg = highlights.green },
	},
	{
		provider = function()
			if not vim.bo.modifiable or vim.bo.readonly then
				return ""
			end
		end,
		hl = { fg = highlights.orange },
	},
}

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			-- use `force` because we need to override the child's hl foreground
			return { fg = highlights.cyan, style = "bold", force = true }
		end
	end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(
	FileNameBlock,
	FileIcon,
	utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
	unpack(FileFlags), -- A small optimisation, since their parent does nothing
	{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

-- Progress bar
local function progress_bar()
	local sbar = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local curr_line = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_line_count(0)
	local i = math.floor(curr_line / lines * (#sbar - 1)) + 1
	return sbar[i]
end

local progress = {
	provider = function()
		return "%3(%P%) " .. progress_bar() .. " "
	end,
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	hl = { fg = highlights.cyan },
}

-- LSP
local diagnostics = {

	condition = conditions.has_diagnostics,

	static = {
		error_icon = " ",
		warn_icon = " ",
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	end,

	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = utils.get_highlight("DiagnosticError").fg },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = utils.get_highlight("DiagnosticWarn").fg },
	},
}

-- GIT
local git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
	end,

	hl = { fg = highlights.orange },

	{ -- git branch name
		provider = function(self)
			return " " .. self.status_dict.head .. " "
		end,
	},
}

-- Show the name of the helpfile you're in
local HelpFileName = {
	condition = function()
		return vim.bo.filetype == "help"
	end,
	provider = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return vim.fn.fnamemodify(filename, ":t")
	end,
	hl = { fg = highlights.blue },
}

-- Clock xD
local clock = {
	os.date(" %a | %H:%M:%S "),
}

local DefaultStatusline = {
	mode,
	space,
	git,
	align,
	FileName,
	diagnostics,
}
local StatusLines = {

	hl = function()
		if conditions.is_active() then
			return {
				fg = utils.get_highlight("StatusLine").fg,
				bg = utils.get_highlight("StatusLine").bg,
			}
		else
			return {
				fg = utils.get_highlight("StatusLineNC").fg,
				bg = utils.get_highlight("StatusLineNC").bg,
			}
		end
	end,

	init = utils.pick_child_on_condition,

	DefaultStatusline,
}
heirline.setup(StatusLines)
