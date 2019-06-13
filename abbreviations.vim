" Abbreviations for Programming

"{{{ ======= Python =======
"Set breakpoint using pudb module
autocmd FileType python inoreabbrev pudb import pudb ; pudb.set_trace()<ESC>
autocmd FileType python inoreabbrev pdb import pdb ; pdb.set_trace()<ESC>
autocmd FileType python inoreabbrev nodb from nose.tools import set_trace ; set_trace()<ESC>

func GetWidth()
    return winwidth(0)
endfunc
func GetHeight()
    " Window height + poweline + statusline + header
    return winheight(0) + 3
endfunc
autocmd FileType python iabbr <silent> tdb from pudb.remote import set_trace ; set_trace(term_size=(<C-R>=GetWidth()<CR>, <C-R>=GetHeight()<CR>))<ESC>

"}}}

"{{{ ======= Ledger =======
"}}}
