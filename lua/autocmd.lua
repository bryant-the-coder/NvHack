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

-----------------------------------
--           Basic               --
-----------------------------------
-- Trim Whitespace ( cleaner code  guess ヾ(•ω•`)o )
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

-- Restore cursor last position upon reopening the file
cmd([[
  augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  augroup END
]])

cmd([[
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]])

-- Reload the contents of file if changed outside of nvim
cmd([[
  augroup auto_reload_file
    autocmd!
    autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on your device. Buffer reload!. Process completed!", 'warn', {'title': 'nvim'})
    autocmd FocusGained,CursorHold * if getcmdwintype() == '' | checktime | endif
  augroup END
]])

-- Highlight when yanking :)
cmd([[
  augroup yank_with_highlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Hide last run command after 10 sec
-- Make the screen clean :)
-- cmd([[
--   augroup _cmdline
--     autocmd!
--     autocmd CmdlineLeave : lua vim.defer_fn(function() vim.cmd('echo ""')end, 10000)
--   augroup END
-- ]])

-----------------------------------
--           Plugins             --
-----------------------------------
-- Nvim-cmp
cmd([[
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])

-- Nvim-lsp
-- Credits to @max397574
cmd([[au CursorHold  * lua vim.diagnostic.open_float()]])
cmd([[hi DiagnosticHeader gui=bold guifg=#2cb27f]])
