-- Colorizer

local status_ok, color = pcall(require, "colorizer")
if not status_ok then
    return
end
require("colorizer").setup({
    "*",
}, {
    mode = "foreground",
    hsl_fn = true,
    RRGGBBAA = true,
    rgb_fn = true,
    css = true,
    css_fn = true,
})

-- Impatient
require("impatient")
require("impatient").enable_profile()

