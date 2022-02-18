vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "astron"

C = require("astron.colors")

local util = require("astron.util")
local base = require("astron.base")
local treesitter = require("astron.treesitter")
local lsp = require("astron.lsp")
local others = require("astron.others")
local cmp = require("astron.cmp")
local markdown = require("astron.markdown")

local astron = {
	base,
	cmp,
	treesitter,
	markdown,
	lsp,
	others,
}

for _, file in ipairs(astron) do
	for group, colors in pairs(file) do
		util.highlight(group, colors)
	end
end
