"{{{ ======= Plugins =======
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Theme plugins
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
let g:nord_uniform_diff_background = 1
let g:nord_italic_comments = 1
Plug 'chriskempson/base16-vim'
Plug 'romainl/Apprentice'

" Productivity plugins
Plug 'myusuf3/numbers.vim'

Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <Leader>a :Rg<CR>
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>k :Ack! "<cword>" <CR>

" Programming plugins
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'mhartington/formatter.nvim'
Plug 'jpalardy/vim-slime'

Plug 'vim-test/vim-test'
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'reedes/vim-pencil'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_list = [
    \ {'path': '~/vimwiki/', 'syntax': 'default', 'ext': '.wiki'},
    \ {'path': '~/Knowledge/Zettelkasten/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1},
    \ {'path': '~/Hive/education/', 'syntax': 'default', 'ext': '.wiki'}
    \ ]
let g:vimwiki_global_ext = 0

Plug 'lifepillar/vim-outlaw'
let g:outlaw_fenced_filetypes = ['sql', 'python', 'go']
nnoremap <leader>wd O<C-R>=strftime("=== %Y-%m-%d %a")<ESC>

Plug 'vhyrro/neorg', { 'branch': 'unstable' } | Plug 'nvim-lua/plenary.nvim'

Plug 'ledger/vim-ledger'
Plug 'pearofducks/ansible-vim'

Plug 'hashivim/vim-terraform'

" Debugging
"let g:termdebug_wide=1
"packadd termdebug
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
nnoremap <silent> <leader>dd :lua require'dapui'.toggle()<CR>
nnoremap <silent> <leader>dc :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>dn :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>di :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>do :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>


Plug 'lervag/vimtex', { 'for': 'tex' }

" Others
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'.'.git/'
nnoremap <F2> <ESC>:Ex<CR>

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" }}}

" {{{ ======= Plugin configurations =======

lua << EOF

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    -- LSP Commands
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end,
    },
    completion = {
        autocomplete = true,
    },
    mapping = {
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({
          select = true
        }),
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
}

-- Formatter
vim.api.nvim_set_keymap('n', '<leader>rf', '<cmd>Format<CR>', { noremap=true, silent=true })

-- Language configurations
require('formatter').setup({
    logging = false,
    filetype = {
        go = {
            -- gofmt
            function()
                return {
                    exe = "gofmt",
                    -- args = {"--emit=stdout"},
                    stdin = true
                }
            end
        }
    }
})

EOF

autocmd FileType go autocmd BufWritePre <buffer> Format

" Debugger
lua require('dap-go').setup()
lua require("dapui").setup()

" Neorg configuration
lua << EOF
    require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
                config = {
                    workspaces = {
                        Zettelkasten = "~/Hive/zettelkasten"
                    }
                }
            }
        },
    }
EOF

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki,tex call pencil#init()
augroup END

" }}}

"{{{ ======= General Options =======
" Set no compatible, for boosting Vim's capabilities
" set nocompatible

" Load local vim source files if they exist (i.e: project-specific settings)
set exrc

" Show numbers by default
"set number

" Repair wired terminal/vim settings
"set backspace=start,eol,indent

" Syntax on/off
"syntax on

" Enable plugins
"filetype on
"filetype plugin on

" Status line - Using powerline plugin
set laststatus=2

" Languages
" set spelllang=ca,en,es

" Colorscheme
let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Linux'
    set termguicolors
endif
set background=dark
colorscheme apprentice

" Unset Swap File
set noswapfile

" Incremental searching
set incsearch

" Case insensitive searches
set ignorecase

" Change the background colour from cursor line
" set cursorline

" Let scroll Vim using the mouse.
set mouse=nicr

" Editing crontab from vim.
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Templates for programming
" source $HOME/.vim/abbreviations.vim

" Disable the annoying error bells.
" set noerrorbells visualbell t_vb=

" Allow to change buffer without saving it
set hidden

" Spell URL
" let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" Change default menu behaviour
" set completeopt+=noinsert,noselect

"}}}

"{{{ ======= Coding Options =======
" Set default indention
set tabstop=4
set shiftwidth=4

" Auto expand tabs to spaces
set expandtab
autocmd Filetype go setlocal noexpandtab

" Auto indent after a {
set smartindent
set autoindent

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

" Show end-of-line whitespaces
set list
set listchars=tab:\|\ ,trail:·

"}}}

"{{{ ======= Mappings =======
" Toggle Folding
nnoremap <space> za

" Set C-Right and C-Left
"map <ESC>[5C <C-Right>
"map <ESC>[5D <C-Left>

" Moving along buffers (vim way)
nnoremap <C-l> <ESC>:bn<CR>
nnoremap <C-h> <ESC>:bp<CR>

" Editing Source/Include files - Prevent the exit if an error occurs
" map gf :edit <cfile><CR>

" FX Functions
map <F1> <nop>

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
    nnoremap <C-right> <nop>
    nnoremap <C-left> <nop>
endif

" Insert new date
nnoremap <leader>nl O<C-R>=strftime('=== %a %Y-%m-%d')<CR>

"}}}

"{{{ ======= Highlights =======
" Cursor Highlights
highlight clear CursorLine SpellBad Cursor
"highlight CursorLine guibg=lightblue ctermbg=238
"highlight SpellBad ctermbg=red term=bold
"highlight Cursor ctermbg=235

" Highlight after the 80th column - this line should be highlighted after the character defined below
highlight clear OverLength
highlight OverLength ctermbg=88 ctermfg=white guibg=#592929

" <- Highlight non-ascii characters
highlight nonascii guibg=#B398CC ctermbg=54

" Highlight the selected code
hi Visual term=reverse cterm=reverse guibg=Grey

"}}}

"{{{ ======= Code Style: Language Specific Settings =======

" ===== Python =====
" Disable smartindent on # comments.
" autocmd FileType python inoremap # X#
" Highlight after 80th character
" NOTE: Deactivated because plugin does the same
" autocmd FileType python match OverLength /\%80v.\+/
" Highlight nonascii characters
autocmd BufWrite,BufRead,BufNewFile *.py 2match nonascii "[^\x00-\x7F]"

" ===== Markdown =====
" Highlight after the 110th column on markdown
autocmd FileType markdown match OverLength /\%110v.\+/
" New line after 110th character
autocmd FileType markdown set textwidth=109

" ===== Vim =====
" Highlight after 80th character
autocmd FileType vim match OverLength /\%80v.\+/

" ===== VimWiki =====
autocmd FileType vimwiki set textwidth=70

" ===== LaTeX =====
autocmd FileType tex set textwidth=70

" ===== Jenkins =====
autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy

"}}}
