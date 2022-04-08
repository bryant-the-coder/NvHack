local notify = require("notify")
local default = {
    stages = "fade",
    render = "default",
    timeout = 2000,
    minimum_width = 60,
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "",
    },
}

vim.opt.termguicolors = true

notify.setup(default)

vim.notify = function(msg, level, opts)
    notify(msg, level, opts)
end

function _G.P(...)
    print(vim.inspect(...))
    return ...
end

vim.notify = require("notify")

vim.cmd([[
highlight link NotifyERRORBody Normal
highlight link NotifyWARNBody Normal
highlight link NotifyINFOBody Normal
highlight link NotifyDEBUGBody Normal
highlight link NotifyTRACEBody Normal
]])

-- This is a command i got from a repo. Will test it out soon
-- vim.api.nvim_command('highlight LightBulbFloatWin ctermfg= ctermbg= guifg= guibg=')
