" Abbreviations for Programming

"{{{ Function for confirming abbreviations

function! s:AbbrAsk(abbr,expansion)
let answer = confirm("Use the abbreviation '". a:abbr ."'?, "&Yes\&No", 1)
return answer == 1 ? a:expansion : a:abbr
endfunction

"}}}

"{{{ ======= Python =======
"Set breakpoint using pudb module
autocmd FileType python inoreabbrev pudb import pudb ; pudb.set_trace()<ESC>
autocmd FileType python inoreabbrev pdb import pdb ; pdb.set_trace()<ESC>
autocmd FileType python inoreabbrev nodb from nose.tools import set_trace ; set_trace()<ESC>

"}}}

"{{{ ======= Ledger =======
autocmd FileType ledger inoreabbrev renfe 2018-04-18 RENFE<CR>Expenses:BMAT:Transport             EUR<CR>Assets:Bank:LaCaixa<ESC>
"}}}
