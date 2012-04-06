"Configuració Vim per Marc Capell v1.0 - 17/10/2011

"{ ======= Prepend Options =======
"}
"{ ======= General Options =======
" Colorscheme (skin)
colorscheme darkspectrum

" Font Inconsolata
set guifont=Inconsolata\ 10

" Maximized window on startup
set lines=999 columns=999
"}
"{ ======= Eclim Settings =======
" Use default Taglist instead of Eclim, avoid problem
let g:EclimTaglistEnabled=0 

" If the current file is in a Eclipse project, open project tree automatically
let g:EclimProjectTreeAutoOpen=1 
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1  "share tree instance through all tabs
"}
"{ ======= Android Functions =======
" Android compile (ant on path)
command! -nargs=0 Install call s:AntDebugInstall()
function! s:AntDebugInstall()
	:Ant -q clean debug
	:Ant -q debug install
endfunction

" Project Tree and change dir
command! -nargs=1 Tree call s:Tree(<f-args>)
function! s:Tree(project)
	exe "ProjectTree " . a:project
	exe "cd android/projects/" . a:project
endfunction

"}
