" Abbreviations for Programming

"{{{ Function for confirming abbreviations

function! s:AbbrAsk(abbr,expansion)
let answer = confirm("Use the abbreviation '". a:abbr ."'?, "&Yes\&No", 1)
return answer == 1 ? a:expansion : a:abbr
endfunction

"}}}

"{{{ ======= Python =======
"Set breakpoint using pudb module
imap sbp import pudb ; pudb.set_trace()<CR><ESC>

"}}}
