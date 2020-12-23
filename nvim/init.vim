" vim-plug
" Plugins will be downloaded to ~/.vim/plugged
call plug#begin('~/.config/nvim/plugged')

" Auto Pairs: insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'

" Commentary: comment out lines of code
Plug 'tpope/vim-commentary'

" Gitgutter: display git diff info
Plug 'airblade/vim-gitgutter'

" Dracula: a spooky theme
Plug 'dracula/vim'

" Polyglot: syntax highlighting for common languages
" Plug 'sheerun/vim-polyglot'

" Ale: asynchronous lint engine
" Plug 'w0rp/ale'

" Vim Go: Golang development
" Plug 'fatih/vim-go'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim Markdown
" Plug 'plasticboy/vim-markdown'

" Initialise plugin system
call plug#end()

" Set the leader key to be space
let mapleader = " "

" Quickly save with ,w
nmap <leader>w :w!<cr>

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
set clipboard=unnamed

" Simplify using tabs
nnoremap ˙ gT
nnoremap ¬ gt
nnoremap T :tabnew<cr>

" Open the current file in a new vertial split with '='
nnoremap = :vsplit<cr>

" Custom ALE linters
:let g:ale_linters = {
\	'go': ['goimports', 'go build', 'go vet', 'staticcheck'],
\	'markdown': []
\}

" Custom ALE fixers
:let g:ale_fixers = {
\	'go': ['goimports'],
\	'python': ['black', 'yapf'],
\	'javascript': ['prettier'],
\	'json': ['prettier'],
\   'javascriptreact': ['prettier'],
\	'html': ['prettier'],
\	'css': ['prettier'],
\   'markdown': ['prettier'],
\	'typescript': ['prettier'],
\   'vimwiki': ['prettier']
\}

let g:ale_fix_on_save = 1

let g:ale_go_staticcheck_lint_package = 1

" Disable gopls
let g:go_gopls_enabled = 0
" Replace functions that use gopls by default with other implementations
let g:go_info_mode = 'guru'
let g:go_def_mode = 'guru'
let g:go_referrers_mode = 'guru'

" Monzo import sorting
let g:ale_go_goimports_options = '-local "github.monzo.com"'

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Organise go imports on save https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/vim.md#coc_nvim
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
