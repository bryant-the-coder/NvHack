local M = {}

local default = {
    colors = require("core.utils").get(),
}

-- Change this to your own name
-- Another username can be found at line 124
local username = {
    -- [[██████╗ ██████╗ ██╗   ██╗ █████╗ ███╗   ██╗████████╗]],
    -- [[██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗████╗  ██║╚══██╔══╝]],
    -- [[██████╔╝██████╔╝ ╚████╔╝ ███████║██╔██╗ ██║   ██║   ]],
    -- [[██╔══██╗██╔══██╗  ╚██╔╝  ██╔══██║██║╚██╗██║   ██║   ]],
    -- [[██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   ]],
    -- [[╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ]],
    [[Bryant]],
}

--- Center the header / ascii
---@param dict string
local function center(dict)
    local new_dict = {}
    for _, v in pairs(dict) do
        local padding = vim.fn.max(vim.fn.map(dict, "strwidth(v:val)"))
        local columns = (" "):rep(math.floor((vim.o.columns - padding) / 2)) .. v
        table.insert(new_dict, columns)
    end
    return new_dict
end

local morning = {
    "",
    "",
    "",
    "",
    [[ ██████   ██████   ██████  ██████      ███    ███  ██████  ██████  ███    ██ ██ ███    ██  ██████]],
    [[██       ██    ██ ██    ██ ██   ██     ████  ████ ██    ██ ██   ██ ████   ██ ██ ████   ██ ██ ]],
    [[██   ███ ██    ██ ██    ██ ██   ██     ██ ████ ██ ██    ██ ██████  ██ ██  ██ ██ ██ ██  ██ ██   ███]],
    [[██    ██ ██    ██ ██    ██ ██   ██     ██  ██  ██ ██    ██ ██   ██ ██  ██ ██ ██ ██  ██ ██ ██    ██]],
    [[ ██████   ██████   ██████  ██████      ██      ██  ██████  ██   ██ ██   ████ ██ ██   ████  ██████]],
    "",
    "",
}

local afternoon = {
    "",
    "",
    "",
    "",
    [[ ██████   ██████   ██████  ██████       █████  ███████ ████████ ███████ ██████  ███    ██  ██████   ██████  ███    ██]],
    [[██       ██    ██ ██    ██ ██   ██     ██   ██ ██         ██    ██      ██   ██ ████   ██ ██    ██ ██    ██ ████   ██]],
    [[██   ███ ██    ██ ██    ██ ██   ██     ███████ █████      ██    █████   ██████  ██ ██  ██ ██    ██ ██    ██ ██ ██  ██]],
    [[██    ██ ██    ██ ██    ██ ██   ██     ██   ██ ██         ██    ██      ██   ██ ██  ██ ██ ██    ██ ██    ██ ██  ██ ██]],
    [[ ██████   ██████   ██████  ██████      ██   ██ ██         ██    ███████ ██   ██ ██   ████  ██████   ██████  ██   ████]],
    "",
    "",
}

local night = {
    "",
    "",
    "",
    "",
    "",
    [[ ██████   ██████   ██████  ██████      ███████ ██    ██ ███████ ███    ██ ██ ███    ██  ██████  ]],
    [[██       ██    ██ ██    ██ ██   ██     ██      ██    ██ ██      ████   ██ ██ ████   ██ ██       ]],
    [[██   ███ ██    ██ ██    ██ ██   ██     █████   ██    ██ █████   ██ ██  ██ ██ ██ ██  ██ ██   ███ ]],
    [[██    ██ ██    ██ ██    ██ ██   ██     ██       ██  ██  ██      ██  ██ ██ ██ ██  ██ ██ ██    ██ ]],
    [[ ██████   ██████   ██████  ██████      ███████   ████   ███████ ██   ████ ██ ██   ████  ██████  ]],
    "",
    "",
}

local mid_night = {
    "",
    "",
    "",
    "",
    "",
    [[███████ ██      ███████ ███████ ██████  ██ ██ ]],
    [[██      ██      ██      ██      ██  ██  ██ ██ ]],
    [[███████ ██      █████   █████   ██████  ██ ██ ]],
    [[     ██ ██      ██      ██      ██            ]],
    [[███████ ███████ ███████ ███████ ██      ██ ██ ]],
    "",
    "",
}

local quotes = {
    "",
    "'Fight for what's right. No matter if it means standing all ALONE'",
}

function M.display()
    if
        not (
            (vim.api.nvim_buf_get_number(0) > 1 or vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]:len() == 0)
            and vim.api.nvim_buf_get_name(0):len() == 0
        )
    then
        return
    end

    vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(0, "buftype", "nofile")

    local time = os.date("*t")
    -- If the time is 5am / less than or equals to 11 then morning
    if time.hour == 5 or time.hour <= 11 then
        vim.api.nvim_put(center(morning), "l", true, true)
        vim.api.nvim_put(center(username), "l", true, true)
    elseif time.hour == 12 or time.hour <= 17 then
        vim.api.nvim_put(center(afternoon), "l", true, true)
        vim.api.nvim_put(center(username), "l", true, true)
    elseif time.hour == 18 or time.hour <= 21 then
        vim.api.nvim_put(center(night), "l", true, true)
        vim.api.nvim_put(center(username), "l", true, true)
    else
        vim.api.nvim_put(center(mid_night), "l", true, true)
        vim.api.nvim_put(center(username), "l", true, true)
    end

    vim.api.nvim_put(center(quotes), "l", true, true)

    vim.cmd([[1]])
    -- DONT EVER USE AUTOCHDIR! USE IT AT YOUR OWN RISK!
    -- autochdir = auto change directory
    -- [[silent! setlocal nonu nornu autochdir ft=dashboard nocul laststatus=0 nowrap]]
    vim.cmd([[silent! setlocal nonu nornu ft=dashboard nocul nowrap]])

    vim.api.nvim_set_hl(0, "Red", { fg = default.colors.green })
    vim.api.nvim_set_hl(0, "Orange", { fg = default.colors.orange, italic = true, bold = true })
    vim.api.nvim_set_hl(0, "Purple", {
        fg = default.colors.purple,
        italic = true,
        bold = true,--[[ , underline = true ]] 
    })
    vim.fn.matchadd("Red", "[██]")
    vim.fn.matchadd("Orange", "Bryant")
    vim.fn.matchadd("Purple", "'Fight for what's right. No matter if it means standing all ALONE'")
    vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q!<CR>", { noremap = true, silent = true })
end

return M
