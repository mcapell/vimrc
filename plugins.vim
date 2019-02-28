" Theme plugins
Plug 'morhetz/gruvbox'
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Productivity plugins
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

Plug 'tpope/vim-surround'
Plug 'natebosch/vim-lsc'
let g:lsc_server_commands = { 'rust': 'rls' }

Plug '/usr/local/opt/fzf'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>a :Ag<CR>

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>k :Ack! "<cword>" <CR>

Plug '~/Development/Apps/vim-worktrack'
let g:worktrack_timestamp_file = "/tmp/worktrack_ts.txt"

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" Language plugins
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
let g:pymode_rope = 1
let g:pymode_syntax = 0
let g:pymode_python = 'python3'

Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
let g:racer_cmd = '~/.cargo/racer/target/release/racer'
let $RUST_SRC_PATH="~/.cargo/racer/src/"


Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_use_calendar = 1

Plug 'ledger/vim-ledger'
Plug 'pearofducks/ansible-vim'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Others
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'.'.git/'
nnoremap <F2> <ESC>:Ex<CR>
