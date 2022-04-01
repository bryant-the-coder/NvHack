vim.cmd([[
    " Command line abbrev
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev vterm 90 vsp <bar> :term

    " Q / q to quit
    cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is#'Q')?('q'):('Q'))
    " W / w to write
    cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is#'W')?('w'):('W'))

    " Insert mode abbrev
    inoreabbrev rev :silent! <c-r>=printf(&commentstring, ' REVISIT '.$USER.' ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev todo <c-r>=printf(&commentstring, ' TODO(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev hack <c-r>=printf(&commentstring, ' HACK(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev fixme <c-r>=printf(&commentstring, ' FIXME(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev bug <c-r>=printf(&commentstring, ' BUG(vsedov) ('.strftime("%T - %d/%m/%y").'):')<CR>
    inoreabbrev teh the
]])
