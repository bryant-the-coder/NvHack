---@diagnostic disable: undefined-global
local print = [[
console.log("$1")
]]

return {
    parse({ trig = "console" }, print),
}
