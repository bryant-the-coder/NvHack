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
		s({ trig = "ses", docstring = "ses" }, {
			t("** Session "),
			i(1, "1 "),
			f(function()
				result = {}
				result.start_hour = os.date("%I") -- defining start hour
				result.start_min = os.date("%M") -- defining start min
				result.status = function()
					return os.date("%p") -- finding wheter pm or am
				end
				result.format = function(ses)
					local hour = tonumber(result.end_hour)
					local min = tonumber(result.end_min)

					if hour < 10 then
						-- result.end_hour = string.sub(tostring(result.end_hour),2,2)
						result.start_hour = string.sub(tostring(result.start_hour), 2, 2)
					end
					if min >= 60 then
						result.end_min = min - 60
						result.end_hour = 1 + hour
						if result.end_min < 10 then
							result.end_min = "0" .. result.end_min
						end
					end
					return "{" .. ses .. " H}" .. " [ " .. result.start_time() .. " -> " .. result.end_time() .. " ]"
				end
				result.adder = function()
					local time = vim.fn.input("Enter session time (H:M) = ")
					local hour = string.sub(time, 1, 1)
					local min = string.sub(time, 3, 4)
					result.end_hour = tonumber(result.start_hour) + tonumber(hour)
					result.end_min = tonumber(result.start_min) + tonumber(min)
					return result.format(time)
					-- result.format(result.end_hour,result.end_min)
				end
				result.end_time = function()
					return result.end_hour .. ":" .. result.end_min .. result.status()
				end
				result.start_time = function()
					return result.start_hour .. ":" .. result.start_min .. result.status()
				end
				return " " .. result.adder()
			end),
			t({ "", "  > " }),
			i(0),
			--[[ f(function(){{{
        local input = vim.fn.input(" Enter time in HH:MM or MM format: ")
        local plus_hour, plus_min
        if input:find(":") == nil then
          plus_hour = 00
          plus_min = input
        else
          plus_hour, plus_min = input:match("(%d+):(%d+)")
        end
        local time = os.date("%I:%M")
        local hour = tonumber(string.sub(time, 1, 2))
        local min = tonumber(string.sub(time, 4, 5))
        -- add plus_hour and plus_min to current time
        hour = hour + tonumber(plus_hour)
        min = min + tonumber(plus_min)
        -- if minutes are more than 60, add 1 hour and subtract 60 minutes
        if min > 60 then
          hour = hour + 1
          min = min - 60
        end
        if hour > 12 then
          hour = hour - 12
        end
        if min < 10 then
          min = "0" .. min
        end
        if hour < 10 then
          hour = string.sub(hour, 2,2)
        end
        local added_time
        if plus_hour ~= 00 then
          added_time = plus_hour .. ":" .. plus_min .. " H"
        else
          added_time = plus_min .. "M"
        end
        return " [" .. added_time .. "]" .. "(" .. time  .. " -> " .. hour .. ":" .. min .. ")"
      end, {}), ]]
			--}}}
		}),
	},
}
