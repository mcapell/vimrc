" Global plugins
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'itchyny/calendar.vim'
Plug 'jamessan/vim-gnupg'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ledger/vim-ledger'
Plug 'maralla/completor.vim'
Plug 'mileszs/ack.vim'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
" Plug 'mcapell/vim-worktrack' - use local version
Plug '~/Development/Apps/vim-worktrack'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Language plugins
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'majutsushi/tagbar', { 'for': 'python' }
Plug 'python-rope/ropevim', { 'for': 'python' }

Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }


Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }

" Requires Java SDK 7+
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }

"{{{ Plugins: Settings
" Airline preferences
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTree preferences
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeIgnore=['\.pyc$', 'node_modules', '__pycache__']

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
nmap <Leader>tt :TagbarToggle<CR>
let g:tagbar_right = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1

" CTRL-P
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }
if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules,*/venv,*/bin

" Worktrack
let g:worktrack_timestamp_file = "/tmp/worktrack_ts.txt"

" vim rust-racer
set hidden
let g:racer_cmd = "/Users/marc/.cargo/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/marc/.cargo/racer/src/"

" Calendar
let g:calendar_first_day = "monday"
let g:calendar_week_number = 1
let g:calendar_google_calendar = 1

"}}}
