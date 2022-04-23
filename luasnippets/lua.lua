---@diagnostic disable: undefined-global
local module = [[
local M = {}

${1:code}

return M
]]

local mappings = [[
map("$1", "$2", "<cmd>$0<CR>")
]]

return {
    parse({ trig = "M" }, module),
    parse({ trig = "map" }, mappings),
}
