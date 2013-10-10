"Configuració Vim per Marc Capell v1.0 - 17/10/2011
"Configuració Vim per Marc Capell v1.1 - 13/08/2013

"{{{ ======= Prepend Options =======
" Setting filetype off, before call pathogen
:filetype off
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" Disable snipMate on gVim
if has('gui_running')
	call add(g:pathogen_disabled, 'snipmate')
	call add(g:pathogen_disabled, 'nerdtree')
	call add(g:pathogen_disabled, 'html5')
endif

" Calling pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

"}}}

"{{{ ======= General Options =======
" Show numbers by default
set number

" Show matching brackets
set showmatch

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" Syntax on/off
syntax on

" Color style
set t_Co=16

" Set no compatible, for boosting Vim's capabilities
set nocompatible

" Enable plugins
filetype plugin on

" Custom title
let &titlestring = "[ vim(Marc::nomorecode) ]"
set title

" Status line - Using powerline plugin
set laststatus=2

" Languajes
set spelllang=ca,en,es

" Templates for programming
source $HOME/.vim/abbreviations.vim

" Colorscheme
set background=dark
colorscheme solarized

" Setting up Omnifunction
set omnifunc=

" Unset Swap File
set noswapfile
"}}}

"{{{ ======= Searching options =======
" Highlighted search results
set hlsearch

" Incremental searching
set incsearch

" Case insensitive searches
set ignorecase

"}}}

"{{{ ======= Showing the code & coding options =======
" Set standard settings
set tabstop=4
set shiftwidth=4

" Auto expand tabs to spaces
set expandtab

" Auto indent after a {
set autoindent
set smartindent

" Do not wrap lines automatically
set nowrap

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Folding options
set foldmethod=marker
set foldmarker={{{,}}}

" Super Clever Tab
function! SuperCleverTab()
"check if at beginning of line or after space
if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
return "\<Tab>"
else
"do we have omni completion available
if &omnifunc != ''
"use omni-completion 1. priority
return "\<C-X>\<C-O>"
elseif &dictionary != ''
"no omni completion, try dictionary completion
return "\<C-K>"
else
"use known-word completion
return "\<C-N>"
endif
endif
endfunction
"bind function to the tab key
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" Show end-of-line whitespaces
set list
set listchars=trail:·

"}}}

"{{{ ======= Code Style: Language Specific Settings =======
" ===== JavaScript =====
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" ===== HTML / CSS / Jade =====
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2

" Setting phtml as html filetype
au BufNewFile,BufRead *.phtml set filetype=html

" ===== Python =====
" Disable smartindent on # comments.
autocmd FileType python inoremap # X^H#

" ===== Golang =====
" Setting golang as filetype
au BufNewFile,BufRead *.go set filetype=Go

"}}}

"{{{ ======= Mappings =======
" Toggle Folding
nnoremap <space> za

" Moving along buffers
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" Editing Source/Include files - Prevent the exit if an error occurs
map gf :edit <cfile><CR>

" FX Functions
map <F1> <ESC>:help
map <F2> <ESC>:NERDTreeToggle<CR>

" Scroll the other window in a Split
nmap <A-j> <C-w>W<C-e><C-w><C-w>W<C-e><C-w>W
nmap <A-k> <C-w>W<C-e><C-w><C-w>W<C-y><C-w>W

"}}}

"{{{ ======= Matching & Highlights =======
" == Highlights ==
highlight clear CursorLine SpellBad Cursor
highlight CursorLine guibg=lightblue ctermbg=238
highlight SpellBad ctermbg=red term=bold
highlight Cursor ctermbg=235

" == Match's ==
" Change the background colour from cursor line
set cursorline

"}}}

"{{{ ======= Plugins =======
" Plugins added by Pathogen - just add the plugin to .vim/bundle/pluginName/* and
" plugin will be added.

" Plugin preferences
" snipMate preferences
let g:snips_author = 'Marc Capell <marc@nomorecode.com>'

" Powerline preferences
let g:Powerline_symbols = 'unicode'

" NERDTree preferences
let g:NERDTreeDirArrows = 1
"}}}
