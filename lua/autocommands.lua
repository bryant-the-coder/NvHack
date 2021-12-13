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

-- Escaping in terminal mode (i cant set it in lua idk y)
exec([[au TermOpen * tnoremap <Esc> <c-\><c-n> <cmd>bd!<CR>]], false)

-- Setting tabs for different filetypes
cmd([[
  autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype scss setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
]])

cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

-- This is for nvim-cmp
-- cmd([[
--   highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--   highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--   highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--   highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--   highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--   highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--   highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--   highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--   highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]])

-- Autosource the file
-- cmd[[
--   augroup source_file
--       autocmd!
--       autocmd BufWritePost $APPDATA/Local/nvim/init.lua source <afile>
--       autocmd BufWritePost $APPDATA/Local/nvim/lua/*.lua source <afile>
--   augroup END
-- ]]

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
    autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on your device. Buffer reload!. Process completed!", 'warn', {'title': 'nvim-config'})
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
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Setting filetype
cmd[[
  augroup types_of_file
    autocmd!
    autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown
    autocmd BufRead,BufNewFile *.{html} set filetype=html
    autocmd BufRead,BufNewFile *.{css} set filetype=css
    autocmd BufRead,BufNewFile *.{scss,sass,less} set filetype=scss
  augroup end
]]

-- Nvim-lsp
cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
