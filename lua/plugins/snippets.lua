local ls = require("luasnip")
local parse = ls.parser.parse_snippet
require("luasnip.loaders.from_vscode").load()

-- Git stuff
local stylua = [[chore: autoformat with stylua]]

-- Lua stuff
local modules = [[
local M = {}
$0
return M
]]

local map = [[map("${1:mode}", "${2:keymaps}", "${3:command}<CR>")]]

-- HTML
local scss = [[
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
		<meta name="description" content="${1:desc}" />

		<!-- icon -->
		<link rel="shortcut icon" type="image/ico" href="icon/favicon.ico" />

		<!-- stylesheet -->
		<link rel="stylesheet" href="dist/css/style.css" />
	</head>

	<body>

	</body>
</html>
]]

local css = [[
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- title -->
		<title>${1:title}</title>

		<!-- description -->
		<meta name="description" content="${2:desc}" />

		<!-- icon -->
		<link rel="shortcut icon" type="image/ico" href="icon/favicon.ico" />

		<!-- stylesheet -->
		<link rel="stylesheet" href="${3:style.css}" />

    <!-- js -->
    <script type="text/javascript" src="${4:main.js}"></script>
	</head>

	<body>

	</body>
</html>
]]

local print = {
	js = [[console.log(${0});]],
	lua = [[print(${0})]],
}

ls.snippets = {
	lua = {
		parse({ trig = "M" }, modules),
		parse({ trig = "map" }, map),
		parse({ trig = "print" }, print.lua),
	},
	git = {
		parse({ trig = "stylua" }, stylua),
	},
	html = {
		parse({ trig = "scss" }, scss),
		parse({ trig = "css" }, css),
	},
	js = {
		parse({ trig = "console" }, print.js),
	},
}
