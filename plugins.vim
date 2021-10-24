" Theme plugins
Plug 'gruvbox-community/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
"Plug 'chriskempson/base16-vim'
"let g:base16 = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Productivity plugins
Plug 'myusuf3/numbers.vim'
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

Plug 'vim-scripts/BufOnly.vim'

" Plug '~/Development/Apps/vim-worktrack'
" let g:worktrack_timestamp_file = "/tmp/worktrack_ts.txt"

" Git plugins
Plug 'tpope/vim-fugitive'

" Programming plugins
Plug 'dense-analysis/ale'
set omnifunc=ale#completion#OmniFunc

let g:ale_linters = {
    \ 'go': ['gofmt', 'go vet', 'gopls'],
    \ 'python': ['mypy', 'pyflakes', 'pylsp'],
    \ 'rust': ['analyzer'],
    \ 'javascript': ['tsserver'],
    \ }
let g:ale_fixers = {
    \ 'go': ['gofmt'],
    \ 'python': ['isort', 'black'],
    \ 'rust': ['rustfmt'],
    \ 'javascript': ['tsfmt'],
    \ }
let g:ale_close_preview_on_insert = 1
" let g:ale_python_black_options = '--line-length=79'

nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gs :ALEHover<CR>
nnoremap <leader>gr :ALEFindReferences<CR>
nnoremap <leader>rf :ALEFix<CR>
nnoremap <leader>rr :ALERename<CR>
nnoremap <leader>n :ALENext<CR>
nnoremap <leader>p :ALEPrevious<CR>


Plug 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#usages_command = ''

Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'vim-test/vim-test'
let g:test#strategy = 'vimterminal'
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'reedes/vim-pencil'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_list = [
    \ {'path': '~/vimwiki/', 'syntax': 'default', 'ext': '.wiki'},
    \ {'path': '~/Knowledge/Zettelkasten/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1},
    \ {'path': '~/Hive/education/', 'syntax': 'default', 'ext': '.wiki'}
    \ ]
" let g:vimwiki_use_calendar = 1
let g:vimwiki_global_ext = 0
nnoremap <leader>wa :execute "edit" vimwiki_list[1].path . strftime("%Y%m%d%H%M%S"). ".md"<CR>
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'lifepillar/vim-outlaw'
let g:outlaw_fenced_filetypes = ['sql', 'python']

Plug 'ledger/vim-ledger'
Plug 'pearofducks/ansible-vim'

Plug 'hashivim/vim-terraform'

" Debugging
let g:termdebug_wide=1
packadd termdebug
"Plug 'vim-vdebug/vdebug'

"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }

" Others
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'.'.git/'
nnoremap <F2> <ESC>:Ex<CR>
