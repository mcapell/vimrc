"{{{ ======= Plugins =======
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Theme plugins
Plug 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
  \ }
  \ }
Plug 'romainl/Apprentice'
Plug 'habamax/vim-psionic'
nnoremap <leader>sc :source $MYVIMRC<CR>

" Productivity plugins
Plug 'myusuf3/numbers.vim'

Plug 'tpope/vim-surround'
Plug 'vim-scripts/BufOnly.vim'
Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/plenary.nvim'
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>k <cmd>Telescope grep_string<cr>
nnoremap <leader>a <cmd>Telescope live_grep<cr>
nnoremap <leader>cd <cmd>Telescope diagnostics<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap gD <cmd>Telescope lsp_type_definitions<cr>
nnoremap gd <cmd>Telescope lsp_definitions<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap ca <cmd>Telescope lsp_code_actions<cr>
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Programming plugins
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'golang/vscode-go'
Plug 'rafamadriz/friendly-snippets'
Plug 'mhartington/formatter.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'knsh14/vim-github-link'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

Plug 'vim-test/vim-test'
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

Plug 'reedes/vim-pencil'

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

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" }}}

" {{{ ======= Plugin configurations =======

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    -- LSP Commands
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local lspkind = require('lspkind')
local cmp = require'cmp'
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[LSP]",
  path = "[Path]",
}

cmp.setup({
    snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            vim_item.menu = source_mapping[entry.source.name]
            return vim_item
        end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({
          select = false
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'nvim_lsp_signature_help' },
    }, {
        { name = 'buffer' },
    }),
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- Server and it's configurations can be found here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'gopls', 'terraformls', 'golangci_lint_ls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
require('lsp_lines').register_lsp_virtual_lines()
vim.diagnostic.config({
  virtual_text = false,
})
vim.diagnostic.config({ virtual_lines = { prefix = "" } })

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'go', 'gomod', 'python', 'rust', 'yaml', 'hcl', 'ledger' },
    highlight = {
        enable = true
    },
    -- indent = {
    --     enable = true
    -- },
}

-- Telescope
require('telescope').setup({
    defaults = {
        file_ignore_patterns = {".git/"},
    },
    pickers = {
        find_files = {
            hidden = true
        },
    },
})

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
                    stdin = true
                }
            end
        },
        terraform = {
            function()
                return {
                    exe = "terraform",
                    args = {"fmt", "-"},
                    stdin = true,
                }
            end
        },
    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.tf,*.tfvars FormatWrite
augroup END
]], true)

-- File manager
require'nvim-tree'.setup{
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}


EOF


" Debugger
lua require('dap-go').setup()
lua require("dapui").setup()

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
let theme='dark'
if theme == 'dark'
    set background=dark
    colorscheme apprentice
    hi Comment ctermbg=NONE ctermfg=242 cterm=NONE guibg=NONE guifg=#6c6c6c gui=NONE
else
    set background=light
    colorscheme psionic
endif

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
set completeopt=menu,menuone,noselect

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
autocmd FileType go,gomod set listchars=tab:\ \ ,trail:·

" Customize netrw
nnoremap <leader>e <ESC>:NvimTreeToggle<CR>
let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'.'.git/'
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" let g:netrw_browse_split = 1
" let g:netrw_winsize = 25

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
