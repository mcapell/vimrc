"{{{ ======= Prepend Options =======
" Load Plug plugin
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()

"}}}

"{{{ ======= General Options =======
" Show numbers by default
set number

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

" Status line - Using powerline plugin
set laststatus=2

" Languages
set spelllang=ca,en,es

" Colorscheme
set background=dark
colorscheme solarized

" Setting up Omnifunction
set omnifunc=

" Unset Swap File
set noswapfile

" Highlighted search results
set hlsearch

" Incremental searching
set incsearch

" Case insensitive searches
set ignorecase

" Change the background colour from cursor line
set cursorline

" Let scroll Vim using the mouse.
set mouse=nicr

" Editing crontab from vim.
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Templates for programming
source $HOME/.vim/abbreviations.vim

" Encryption type.
"set cm=blowfish

" Disable the annoying error bells.
set noerrorbells visualbell t_vb=
"}}}

"{{{ ======= Coding Options =======
" Set standard indention
set tabstop=4
set shiftwidth=4

" Auto expand tabs to spaces
set expandtab

" Auto indent after a {
set autoindent
set smartindent

" Show matching brackets
set showmatch

" Do not wrap lines automatically
set nowrap

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=10

" Folding options
set foldmethod=marker
set foldmarker={{{,}}}

" Super Clever Tab
" function! SuperCleverTab()
" "check if at beginning of line or after space
" if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
" return "\<Tab>"
" else
" "do we have omni completion available
" if &omnifunc != ''
" "use omni-completion 1. priority
" return "\<C-X>\<C-O>"
" elseif &dictionary != ''
" "no omni completion, try dictionary completion
" return "\<C-K>"
" else
" "use known-word completion
" return "\<C-N>"
" endif
" endif
" endfunction
" "bind function to the tab key
" inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" Show end-of-line whitespaces
set list
set listchars=trail:·

"}}}

"{{{ ======= Mappings =======
" Toggle Folding
nnoremap <space> za

" Set C-Right and C-Left
map <ESC>[5C <C-Right>
map <ESC>[5D <C-Left>

" Moving along buffers
nnoremap <C-right> <ESC>:bn<CR>
nnoremap <C-left> <ESC>:bp<CR>
" Moving along buffers (vim way)
nnoremap <C-l> <ESC>:bn<CR>
nnoremap <C-h> <ESC>:bp<CR>
" Fix for NeoVIM
if has('nvim')
    nnoremap <BS> <ESC>:bp<CR>
endif

" Editing Source/Include files - Prevent the exit if an error occurs
map gf :edit <cfile><CR>

" FX Functions
map <F12> <ESC>:help
map <F2> <ESC>:NERDTreeToggle<CR>
map <F3> <ESC>:GundoToggle<CR>

" Scroll the other window in a Split
nmap <A-j> <C-w>W<C-e><C-w><C-w>W<C-e><C-w>W
nmap <A-k> <C-w>W<C-e><C-w><C-w>W<C-y><C-w>W

" Disable arrow keys to force the hands on hjkl
let vimpureta=1
if vimpureta
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>
endif

" Avoid ESC key
imap jk <Esc>
"}}}

"{{{ ======= Highlights =======
" Cursor Highlights
highlight clear CursorLine SpellBad Cursor
highlight CursorLine guibg=lightblue ctermbg=238
highlight SpellBad ctermbg=red term=bold
highlight Cursor ctermbg=235

" Highlight after the 80th column
highlight clear OverLength
highlight OverLength ctermbg=88 ctermfg=white guibg=#592929
autocmd BufWrite,BufRead,BufNewFile * match OverLength /\%80v.\+/

" Highlight non-ascii characters
highlight nonascii guibg=#B398CC ctermbg=54
autocmd BufRead,BufWrite,BufNewFile python match nonascii "[^\u0000-\u007F]"

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
autocmd FileType python inoremap # X#

" ===== Golang =====
" Setting golang as filetype
au BufNewFile,BufRead *.go set filetype=Go

" ===== Arduino =====
" Setting Arduino filetype as C
au BufNewFile,BufRead *.ino set filetype=C

" ===== Markdown =====
" Highlight after the 110th column on markdown
autocmd BufWrite,BufRead,BufNewFile *.md match OverLength /\%110v.\+/
au BufNewFile,BufRead *.md set textwidth=110

"}}}

"{{{ ======= Plugins =======
" Airline preferences
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTree preferences
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeIgnore=['\.pyc$']

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Vim-gnupg, default recipients.
let g:GPGDefaultRecipients = ["keybase.io/mcapell <mcapell@keybase.io>"]

" Rainbow parentheses.
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound

" Rope
let g:pymode_rope = 0

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1

" CTRL-P
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|node_modules|sass-cache|bower_components|build|venv)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }

"}}}
