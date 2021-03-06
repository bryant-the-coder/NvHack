local present, toggleterm = pcall(require, "toggleterm")
if not present then
    return
end

--This is for custom command
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    float_opts = {
        -- border = "shadow",
        border = {
            "╔",
            "═",
            "╗",
            "║",
            "╝",
            "═",
            "╚",
            "║",
        },
        winblend = 0,
        highlights = {
            border = "FloatBorder",
            background = "NormalFloat",
        },
    },
})

-- Custom command
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end
