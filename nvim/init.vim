" vim-plug
" Plugins will be downloaded to ~/.vim/plugged
call plug#begin('~/.config/nvim/plugged')

" Auto Pairs: insert or delete brackets, parens, quotes in pairs
" Plug 'jiangmiao/auto-pairs'

" Nvim autopairs
Plug 'windwp/nvim-autopairs'

" nvim-lspconfig: LSP for nvim
Plug 'neovim/nvim-lspconfig'

" Zig language
Plug 'ziglang/zig.vim'

" Copilot
Plug 'github/copilot.vim'

" Commentary: comment out lines of code
Plug 'tpope/vim-commentary'

" Gitgutter: display git diff info
Plug 'airblade/vim-gitgutter'

" Dracula: a spooky theme
Plug 'dracula/vim'

" Nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Polyglot: syntax highlighting for common languages
" Plug 'sheerun/vim-polyglot'

" Ale: asynchronous lint engine
Plug 'w0rp/ale'

" Vim Vinegar: Simplify netrw
Plug 'tpope/vim-vinegar'

" Goyo: distraction-free writing
" Plug 'junegunn/goyo.vim'

" Logbook: take note
Plug 'jamesroutley/logbook.vim'

" Pico8 syntax
" Plug 'justinj/vim-pico8-syntax'

" Fugitive: git wrapper
Plug 'tpope/vim-fugitive'

" Rhubarb: GitHub extension for fugitive
Plug 'tpope/vim-rhubarb'

" FZF: fuzzy file finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" CtrlSF: searching
Plug 'dyng/ctrlsf.vim'

" Editorconfig: editor configuration
Plug 'editorconfig/editorconfig-vim'

" Vim wiki
" Plug 'vimwiki/vimwiki'

" Deoplete: autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1

" COC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim Markdown
" Plug 'plasticboy/vim-markdown'

"cmp dependencies
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Initialise plugin system
call plug#end()

" Set the leader key to be space
let mapleader = " "

" Quickly save with ,w
nmap <leader>w :w!<cr>

nmap <leader>lr :LspRestart<cr>

" Easy split navigation
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open new splits to right and bottom
set splitbelow
set splitright

" Hide search highlights with ,<cr>
map <silent> <leader><cr> :noh<cr>

" Colorscheme
color dracula

" Line numbers
set number

" Search behaviour
" Ignore case when searching
set ignorecase
" Except when the search query contains a capital letter
set smartcase

" Colour at column 80
set colorcolumn=80

" Copy to/from the macOS clipboard
" set clipboard=unnamed
set clipboard+=unnamedplus

" Simplify using tabs
nnoremap ˙ gT
nnoremap ¬ gt
nnoremap T :tabnew<cr>

" Open the current file in a new vertial split with '='
nnoremap = :vsplit<cr>

" Custom ALE linters
:let g:ale_linters = {
\	'go': ['goimports', 'go build', 'go vet', 'golangci-lint'],
\	'markdown': [],
\   'javascript': [],
\   'proto': ['buf-lint']
\}

" Custom ALE fixers
:let g:ale_fixers = {
\	'python': ['black', 'yapf'],
\	'javascript': ['prettier'],
\	'json': ['prettier'],
\   'javascriptreact': ['prettier'],
\	'html': ['prettier'],
\	'mjml': ['prettier'],
\	'css': ['prettier'],
\   'markdown': ['prettier'],
\	'typescript': ['prettier'],
\   'vimwiki': ['prettier'],
\   'graphql': ['prettier']
\}

let g:ale_fix_on_save = 1

let g:ale_go_staticcheck_lint_package = 1
let g:ale_go_golangci_lint_package = 1

" Wrap long lines on spaces/tabs rather than the last character that fits on the screen
set linebreak

" Enable live update search/replace
set inccommand=nosplit

" 24 bit colour
set termguicolors

" Switch focus to CtrlSF pane when searching is finished
let g:ctrlsf_auto_focus = {
\ 	"at" : "done",
\ 	"duration_less_than": 1000
\ }

" Bash-style autocomplete
" https://stackoverflow.com/a/526940/4129860
set wildmode=longest,list,full
set wildmenu

" Keep at least 10 lines of context when scrolling
set scrolloff=10

" Use '%' to jump to the corresponding HTML tag
runtime macros/matchit.vim

" Deoplete <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Vim Markdown
" Disable folding
let g:vim_markdown_folding_disabled = 1
" Syntax highlight YAML frontmatter
let g:vim_markdown_frontmatter = 1

" Disable modelines. I don't use them, and they've been the source of
" vulnerabilities in the past - e.g:
" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set modelines=0
set nomodeline

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Add a new command, :Ds, which enters a datestamp under the cursor, with a
" markdown h2 ## before it
command! -nargs=0 Ds execute "normal! i## " . strftime("%Y-%m-%d") . "\n\n- "

" Vim wiki config
let g:vimwiki_list = [{
\   'path': '~/knowledge-base/',
\   'syntax': 'markdown',
\   'ext': '.md',
\   'links_space_char': '-'
\}]

" Remove duplicate Vim wiki mappings. Mapping to the first bit of a UUID
" because I don't know how to unmap :shrug:
nmap <leader>B5BF6201 <Plug>VimwikiAddHeaderLevel
nmap <leader>96B18E9D <Plug>VimwikiRemoveHeaderLevel

autocmd Filetype vimwiki nmap <C-j> <Plug>VimwikiNextLink
autocmd Filetype vimwiki nmap <C-k> <Plug>VimwikiPrevLink

" Use Clojure syntax highlighting for Sketch files
autocmd BufNewFile,BufRead *.skt   set syntax=clojure
" Set commentstring for Sketch files, so vim-commentry works
autocmd BufNewFile,BufRead *.skt   set commentstring=;%s

" Set MJML filetype for .mjml files
autocmd BufNewFile,BufRead *.mjml   set filetype=mjml
" Use XML syntax highlighting for MJML files
autocmd BufNewFile,BufRead *.mjml   set syntax=xml

" Terraform syntax highlighting
" autocmd BufNewFile,BufRead *.tf   set syntax=tf

" autocmd BufNewFile,BufRead *.skt   set formatprg=sketch\ format

" Use SQL syntax highlighting for Sketch files
autocmd BufNewFile,BufRead *.cql   set syntax=sql

" Vsnip moving
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

lua require 'lsp_config'
lua require 'cmp_config'
lua require 'treesitter_config'

lua << EOF
require("nvim-autopairs").setup {}
EOF
