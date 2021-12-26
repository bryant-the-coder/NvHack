local cmd = vim.cmd
local exec = vim.api.nvim_exec

local NoWhitespace = exec(
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

-- Trim Whitespace (noiceeeeeeeee)
exec([[au BufWritePre * call NoWhitespace()]], false)

-- Disable autocommenting in new lines (kinda annoying)
exec([[au BufEnter * set fo-=c fo-=r fo-=o]], false)

-- Terminal
cmd([[
  augroup terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber
    au TermOpen * tnoremap <Esc> <c-\><c-n> <cmd>bd!<CR>
  augroup END
]])

-- Setting tabs for different filetypes
cmd([[
  autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype scss setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
]])

-- This is for nvim-cmp
cmd([[
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])

-- Restore cursor last position upon reopening the file
cmd[[
  augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  augroup END
]]

-- Reload the contents of file if changed outside of nvim
cmd[[
  augroup auto_reload_file
    autocmd!
    autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on your device. Buffer reload!. Process completed!", 'warn', {'title': 'nvim'})
    autocmd FocusGained,CursorHold * if getcmdwintype() == '' | checktime | endif
  augroup END

  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
]]

-- Highlight when yanking :)
cmd[[
  augroup yank_with_highlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Nvim-lsp
-- 1. When there is any diagnostic it will open a float (kinda useful :)
-- VSCode like
cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
-- 2. Highlights the number. (i dun like icons anyways)
cmd [[
  highlight DiagnosticLineNrError guibg=#B90E0A guifg=#ffffff gui=bold
  highlight DiagnosticLineNrWarn  guibg=#d38b04 guifg=#ffffff gui=bold
  highlight DiagnosticLineNrInfo  guibg=#4682b4 guifg=#ffffff gui=bold
  highlight DiagnosticLineNrHint  guibg=#228b22 guifg=#ffffff gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

cmd [[
  highlight GitSignsCurrentLineBlame guifg=#827e7e
]]
