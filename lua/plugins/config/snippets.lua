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
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
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
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

local module = [[
local M = {}

${1:code}

return M
]]

local mappings = [[
map("$1", "$2", "<cmd>$0<CR>")
]]

local print = [[
console.log("$1")
]]

local scss_template = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- use this command in the terminal -->
        <!--sass --no-source-map --watch scss:css-->

        <!-- title -->
        <title>${1:title}</title>

        <!-- description -->
        <meta name="description" content="${2:desc}" />

        <!-- icon -->
        <link rel="shortcut icon" type="image/ico" href="${3:path}" />

        <!-- stylesheet -->
        <link rel="stylesheet" href="${4:path2}" />

        <!-- js -->
        <script type="text/javascript" src="${5:location}"></script>
    </head>

    <body>
      $0
    </body>
</html>
]]

local css_template = [[
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- title -->
        <title>$1</title>

        <!-- description -->
        <meta name="description" content="$2" />

        <!-- icon -->
        <link rel="shortcut icon" type="image/ico" href="$3" />

        <!-- stylesheet -->
        <link rel="stylesheet" href="$4" />

        <!-- js -->
        <script type="text/javascript" src="$5"></script>
    </head>

    <body>
      $0
    </body>
</html>
]]

local format = [[
chore: autoformat with stylua
]]

ls.snippets = {
	lua = {
		parse({ trig = "M" }, module),
		parse({ trig = "map" }, mappings),
	},
	javascript = {
		parse({ trig = "console" }, print),
	},
	html = {
		parse({ trig = "scss" }, scss_template),
		parse({ trig = "css" }, css_template),
	},
	all = {
		parse({ trig = "stylua" }, format),
	},
	norg = {
		s({ trig = "Ses" }, {
			t({ "Session " }),
			i(1, "1"),
			f(function()
				local input = vim.fn.input(" Enter time in HH:MM or MM format: ")
				local plus_hour, plus_min
				if input:find(":") == nil then
					plus_hour = 00
					plus_min = input
				else
					plus_hour, plus_min = input:match("(%d+):(%d+)")
				end
				local t = os.date("%H:%M")
				local h = tonumber(string.sub(t, 1, 2))
				local m = tonumber(string.sub(t, 4, 5))
				-- add plus_hour and plus_min to current time
				h = h + tonumber(plus_hour)
				m = m + tonumber(plus_min)
				-- if minutes are more than 60, add 1 hour and subtract 60 minutes
				if m > 60 then
					h = h + 1
					m = m - 60
				end
				if h > 24 then
					h = h - 24
				end
				if m < 10 then
					m = "0" .. m
				end
				local added_time
				if plus_hour ~= 00 then
					added_time = plus_hour .. ":" .. plus_min .. " H"
				else
					added_time = plus_min .. "M"
				end

				return " [" .. added_time .. "]" .. "(" .. t .. " -> " .. h .. ":" .. m .. ")"
			end, {}),
			t({ "{" }),
			i(3, "topic"),
			t({ "}" }),
		}),
		s("neorg project starter", {
			t("#context $"),
			i(1, "context name"),
			t({ "$", "" }),
			t("#time.start $"),
			i(2, "date"),
			t({ "$", "" }),
			t("#time.due $"),
			i(3, "date"),
			t({ "$", "" }),
			t("* $"),
			i(4, "project name"),
			t({ "$", "" }),
			t("- [ ] $"),
			i(5, "task description"),
			t("$"),
		}),
	},
}
