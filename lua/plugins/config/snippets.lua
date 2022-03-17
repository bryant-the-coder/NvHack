local ls = require("luasnip")
local parse = ls.parser.parse_snippet
local types = require("luasnip.util.types")
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
}
