" Global plugins
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'itchyny/calendar.vim'
Plug 'jamessan/vim-gnupg'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ledger/vim-ledger'
Plug 'mileszs/ack.vim'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'mcapell/vim-worktrack' - use local version
Plug '~/Development/Apps/vim-worktrack'
Plug 'junegunn/goyo.vim'
Plug 'natebosch/vim-lsc'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Language plugins
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
let g:SuperTabClosePreviewOnPopupClose = 1

" Vim-gnupg, default recipients.
let g:GPGDefaultRecipients = ["keybase.io/mcapell <mcapell@keybase.io>"]

" Rainbow parentheses.
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound

" Rope
let g:pymode_rope = 0
" Overload the go-to-definition command
autocmd FileType python nnoremap <C-]> <ESC>:RopeGotoDefinition<CR>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>a :Ag<CR>

" Worktrack
let g:worktrack_timestamp_file = "/tmp/worktrack_ts.txt"

" vim rust-racer
let g:racer_cmd = '~/.cargo/racer/target/release/racer'
let $RUST_SRC_PATH="~/.cargo/racer/src/"

" Calendar
let g:calendar_first_day = "monday"
let g:calendar_week_number = 1
let g:calendar_google_calendar = 1

" Vimwiki
let g:vimwiki_use_calendar = 1

"" Language Server Client - requires pyls: pip install pyls
let g:lsc_server_commands = {
    \ 'python': 'pyls',
    \ 'rust': 'rustup run nightly-2018-01-14-x86_64-apple-darwin rls',
    \ }
"}}}
