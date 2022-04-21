local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("_terminal", {})

-- Disable autocommenting
cmd("BufEnter", {
    desc = "Disable autocommenting in new lines",
    command = "set fp-=c fo-=r fo-=o",
})

-- Terminal settings
cmd("TermOpen", {
    desc = "Terminal settings",
    group = "_terminal",
    command = "startinsert",
})

cmd("TermOpen", {
    desc = "Terminal settings",
    group = "_terminal",
    command = "setlocal nonumber norelativenumber",
})

augroup("_buffer", {})
-- Trim whitespace
local NoWhitespace = vim.api.nvim_exec(
    [[
    function! NoWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfunction
    call NoWhitespace()
    ]],
    true
)

cmd("BufWritePre", {
    desc = "Trim whitespace on save",
    group = "_buffer",
    command = [[call NoWhitespace()]],
})

-- Cursor position
cmd("BufReadPost", {
    desc = "Restore cursor position upon reopening the file",
    group = "_buffer",
    command = [[
       if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
    ]],
})

-- Highlight while yanking
cmd("TextYankPost", {
    desc = "Highlight while yanking",
    group = "_buffer",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual" })
    end,
})

cmd("FileType", {
    desc = "Quit with q in this filetypes",
    group = "_buffer",
    pattern = "qf,help,man,lspinfo,startuptime,Trouble",
    callback = function()
        vim.keymap.set("n", "q", "<CMD>close<CR>")
    end,
})

cmd({ "VimEnter" }, {
    callback = function()
        require("custom.dashboard").display()
    end,
})

-- Nofity when file changes
augroup("_auto_reload_file", {})
cmd("FileChangedShellPost", {
    desc = "Actions when the file is changed outside of Neovim",
    group = "_auto_reload_file",
    callback = function()
        vim.notify("File changed, reloading the buffer", vim.log.levels.ERROR)
    end,
})

cmd({ "FocusGained", "CursorHold" }, {
    desc = "Actions when the file is changed outside of Neovim",
    group = "_auto_reload_file",
    command = [[if getcmdwintype() == '' | checktime | endif]],
})
augroup("_lsp", {})
cmd({ "CursorHold" }, {
    desc = "Open float when there is diagnostics",
    group = "_lsp",
    callback = vim.diagnostic.open_float,
})
