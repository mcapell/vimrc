"Configuració Vim per Marc Capell v1.0 - 17/10/2011

"{ ======= Prepend Options =======
" Setting filetype off, before call pathogen
:filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#infect()
call pathogen#helptags()

"}
"{ ======= General Options =======
" Show numbers by default
set number

" Show matching brackets
set showmatch

" Repair wired terminal/vim settings
set backspace=start,eol

" Syntax on/off
syntax on

" Paste from other app's
"set paste

" Set no compatible, for boosting Vim's capabilities
set nocompatible

" Enable plugins
filetype plugin on

" Custom title
let &titlestring = "[ vim(Marc::bToolkit) ]"
set title

" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

" Languajes
set spelllang=ca,en,es

" Templates for programming
source $HOME/.vim/abbreviations.vim

" Colorscheme
colorscheme delek

" Setting up Omnifunction
set omnifunc=

"}
"{ ======= Searching options =======
" Highlighted search results
set hlsearch

" Incremental searching
set incsearch

" Case insensitive searches
set ignorecase

"}
"{ ======= Showing the code & coding options =======
" Set standard settings
set tabstop=4
set shiftwidth=4

" Auto expand tabs to spaces
"set expandtab

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
set foldmarker=//{,//}
set foldmarker=/*{,}*/
set foldmarker=#{,#}
set foldmarker=\"{,\"}

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

"}
"{ ======= Mappings =======
" Toggle Folding
nnoremap <space> za

" Moving along buffers
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" Editing Source/Include files - Prevent the exit if an error occurs
map gf :edit <cfile><CR>

" FX Functions
map <F2> <ESC>:NERDTreeToggle<CR>

" Setting phtml as html filetype
au BufNewFile,BufRead *.phtml set filetype=html

" Abbreviations
abbrev btk "Marc Capell - bToolkit.com"

"}
"{ ======= Matching & Highlights =======
" == Highlights ==
highlight clear CursorLine SpellBad
highlight CursorLine guibg=lightblue ctermbg=darkgray
highlight SpellBad ctermbg=red term=bold
" == Match's ==
" Change the background colour from cursor line
set cursorline

"}
"{ ======= Plugins =======
" Plugins added by Pathogen - just add the plugin to .vim/bundle/pluginName/* and
" plugin will be added.
"}
