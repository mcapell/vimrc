" Abbreviations for Programming - Marc Capell - v0.1 - Last update: 17/10/2011

"{ Function for confirming abbreviations

function! s:AbbrAsk(abbr,expansion)
let answer = confirm("Use the abbreviation '". a:abbr ."'?, "&Yes\&No", 1)
return answer == 1 ? a:expansion : a:abbr
endfunction

"}

"{ ======= Non specific languaje =======
iabbrev if! if () {<CR><Tab><CR><ESC><Insert>}<CR><ESC>kkklll<Insert>

"}

"{ ======= PHP =======


"}

"{ ======= XHTML - HTML5 =======

"}


