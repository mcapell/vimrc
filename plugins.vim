" Theme plugins
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <Leader>a :Ag<CR>

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>k :Ack! "<cword>" <CR>

" Plug '~/Development/Apps/vim-worktrack'
" let g:worktrack_timestamp_file = "/tmp/worktrack_ts.txt"

" Git plugins
Plug 'tpope/vim-fugitive'

" Programming plugins
Plug 'dense-analysis/ale'

let g:ale_linters = {
    \ 'go': ['gofmt', 'go vet', 'gopls'],
    \ 'python': ['mypy', 'pyls'],
    \ 'rust': ['analyzer'],
    \ }
let g:ale_fixers = {
    \ 'go': ['gofmt'],
    \ 'python': ['black'],
    \ 'rust': ['rustfmt'],
    \ }
" let g:ale_close_preview_on_insert = 1

nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gs :ALEHover<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
nnoremap <silent> ff :ALEFix<CR>
nnoremap <silent> rr :ALERename<CR>

Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_use_calendar = 1
"let g:vimwiki_global_ext = 0

Plug 'ledger/vim-ledger'
Plug 'pearofducks/ansible-vim'

Plug 'hashivim/vim-terraform'

" Debugging
let g:termdebug_wide=1
packadd termdebug
"Plug 'vim-vdebug/vdebug'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Others
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'.'.git/'
nnoremap <F2> <ESC>:Ex<CR>
