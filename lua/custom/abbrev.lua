vim.cmd([[
    inoreabbrev rev :silent! <c-r>=printf(&commentstring, ' REVISIT '.$USER.' ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev todo <c-r>=printf(&commentstring, ' TODO(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev hack <c-r>=printf(&commentstring, ' HACK(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev fixme <c-r>=printf(&commentstring, ' FIXME(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev bug <c-r>=printf(&commentstring, ' BUG(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev teh the
]])
