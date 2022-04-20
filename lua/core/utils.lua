local M = {}
local cmd = vim.cmd

--- Define bg color
---@param group string
---@param col string
M.bg = function(group, col)
    cmd("hi " .. group .. " guibg=" .. col)
end

--- Define fg color
---@param gruop string
---@param col string
M.fg = function(gruop, col)
    cmd("hi " .. gruop .. " guifg=" .. col)
end

--- Define fg & bg color
---@param group string
---@param fgcol string
---@param bgcol string
M.fg_bg = function(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

--- Getting color from base16
-- Theme that i like
-- A) everblush
-- B) UWU
-- C) everforest
-- D) onedark
-- E) gruvchad
M.get = function()
    local theme = _G.theme
    -- local time = os.date("*t")
    -- if time.hour < 7 or time.hour >= 21 then
    --     theme = "onedark"
    -- else
    --     theme = "everblush"
    -- end
    return require("hl_themes." .. theme)
end

--- Go to url
---@param cmd thread https://github.com
M.url = function(cmd)
    local url = vim.api.nvim_get_current_line():match([[%[.*]%((.*)%)]]) -- To work on md links
    if url == nil then
        url = vim.fn.expand("<cWORD>")
        if not string.match(url, "http") then
            url = "https://github.com/" .. url
        end
        if string.match(url, [[(.+)[,:]$]]) then
            url = url:sub(1, -2)
        end -- to check commas at the end
    end

    vim.notify("Going to " .. url, "info", { title = "Opening browser..." })
    vim.cmd(":silent !" .. cmd .. " " .. url)
    -- vim.cmd(':silent !'..(cmd or "xdg-open")..' '..url..' 1>/dev/null')
end

--- Swap between booleans with ease
M.swap_boolean = function()
    local c = vim.api.nvim_get_current_line()
    local subs = c:match("true") and c:gsub("true", "false") or c:gsub("false", "true")
    vim.api.nvim_set_current_line(subs)
end

--- Rename a variable (simple)
---@return string
M.rename = function()
    -- local border = {
    --     { "┏", "FloatBorder" },
    --     { "━", "FloatBorder" },
    --     { "┓", "FloatBorder" },
    --     { "┃", "FloatBorder" },
    --     { "┛", "FloatBorder" },
    --     { "━", "FloatBorder" },
    --     { "┗", "FloatBorder" },
    --     { "┃", "FloatBorder" },
    -- }

    -- local border = {
    -- 	{ "╔", "FloatBorder" },
    -- 	{ "═", "FloatBorder" },
    -- 	{ "╗", "FloatBorder" },
    -- 	{ "║", "FloatBorder" },
    -- 	{ "╝", "FloatBorder" },
    -- 	{ "═", "FloatBorder" },
    -- 	{ "╚", "FloatBorder" },
    -- 	{ "║", "FloatBorder" },
    -- }

    local border = {
        { "╭", "CmpBorder" },
        { "─", "CmpBorder" },
        { "╮", "CmpBorder" },
        { "│", "CmpBorder" },
        { "╯", "CmpBorder" },
        { "─", "CmpBorder" },
        { "╰", "CmpBorder" },
        { "│", "CmpBorder" },
    }
    local function post(rename_old)
        vim.cmd("stopinsert!")
        local rename_new = vim.api.nvim_get_current_line()
        vim.schedule(function()
            vim.api.nvim_win_close(0, true)
            vim.lsp.buf.rename(vim.trim(rename_new))
        end)
        -- Use notify.nvim, logs notification as warn, title as Variable Rename
        vim.notify(rename_old .. "  " .. rename_new, vim.log.levels.WARN, { title = "Variable Rename" })
    end
    local rename_old = vim.fn.expand("<cword>")
    local created_buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(created_buffer, true, {
        relative = "cursor",
        style = "minimal",
        border = border,
        row = 1,
        col = 0,
        width = 30,
        height = 1,
    })
    vim.cmd("startinsert")

    vim.keymap.set("i", "<ESC>", function()
        vim.cmd("q")
        vim.cmd("stopinsert")
    end, { buffer = created_buffer })

    vim.keymap.set("i", "<CR>", function()
        return post(rename_old)
    end, { buffer = created_buffer })
end

return M
