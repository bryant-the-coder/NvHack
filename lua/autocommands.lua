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

-- Setting tabs for different filetypes
cmd([[
  autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype scss setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
]])

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
    autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on your device. Buffer reload!", 'warn', {'title': 'nvim-config'})
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
]]
