local print = [[
console.log("$1")
]]

return {
	parse({ trig = "console" }, print),
}
