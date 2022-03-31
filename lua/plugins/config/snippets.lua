local ls = require("luasnip")
local parse = ls.parser.parse_snippet
local types = require("luasnip.util.types")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.setup({
	-- This tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection
	history = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets:
	enable_autosnippets = true,

	-- Crazy highlights!!
	-- #vid3
	-- ext_opts = nil,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
				priority = 0,
			},
		},
	},
	ship_env = {
		s = s,
		sn = sn,
		t = t,
		i = i,
		f = f,
		c = c,
		d = d,
		l = l,
		r = r,
		rep = rep,
		p = p,
		m = m,
		dl = dl,
		fmt = fmt,
		fmta = fmta,
		n = n,
		ls = ls,
		types = require("luasnip.util.types"),
		parse = parse,
	},
})
require("luasnip.loaders.from_lua").lazy_load()
