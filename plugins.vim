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

" Language plugins
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'  " can this be replaced by pyls?

let b:ale_linters = ['flake8', 'mypy', 'pylint', 'pyright', 'pyls']

nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gs :ALEHover<CR>

Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_use_calendar = 1
"let g:vimwiki_global_ext = 0

Plug 'ledger/vim-ledger'
Plug 'pearofducks/ansible-vim'

" Debugging
Plug 'vim-vdebug/vdebug'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'JamshedVesuna/vim-markdown-preview', {'for': 'markdown'}
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_pandoc=1

" Others
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'.'.git/'
nnoremap <F2> <ESC>:Ex<CR>
