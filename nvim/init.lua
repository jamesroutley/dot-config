vim.api.nvim_exec(
[[
" vim-plug
" Plugins will be downloaded to ~/.vim/plugged
call plug#begin('~/.config/nvim/plugged')

" Auto Pairs: insert or delete brackets, parens, quotes in pairs
Plug 'jiangmiao/auto-pairs'

" nvim-lspconfig: LSP for nvim
Plug 'neovim/nvim-lspconfig'

" Zig language
Plug 'ziglang/zig.vim'

" Commentary: comment out lines of code
Plug 'tpope/vim-commentary'

" Gitgutter: display git diff info
Plug 'airblade/vim-gitgutter'

" Dracula: a spooky theme
Plug 'dracula/vim'

" Polyglot: syntax highlighting for common languages
" Plug 'sheerun/vim-polyglot'

" Ale: asynchronous lint engine
Plug 'w0rp/ale'

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
\	'go': ['goimports', 'go build', 'go vet', 'staticcheck'],
\	'markdown': [],
\   'javascript': []
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

" autocmd BufNewFile,BufRead *.skt   set formatprg=sketch\ format

" Use SQL syntax highlighting for Sketch files
autocmd BufNewFile,BufRead *.cql   set syntax=sql
]],
true
)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  if filetype == 'go' then
      vim.cmd [[autocmd BufWritePre <buffer> :lua require('lsp.helpers').goimports(2000)]]
  end
end

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
	filetypes = {"go", "gomod"},

	-- Ignore typical project roots which cause gopls to ingest large monorepos.
	--root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	root_dir = util.root_pattern("main.go", "README.md", "LICENSE"),

	settings = {
		gopls = {
			-- Don't try to find the go.mod file, otherwise we ingest large monorepos
			expandWorkspaceToModule = false,
			memoryMode = "DegradeClosed",
			directoryFilters = {
				"-vendor",
				"-manifests",
			},
		},
	},

    on_attach = on_attach,
}

-- -- Organise imports like goimports
-- -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#imports
-- function org_imports(wait_ms)
-- 	local params = vim.lsp.util.make_range_params()
-- 	params.context = {only = {"source.organizeImports"}}
-- 	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
-- 	for _, res in pairs(result or {}) do
-- 		for _, r in pairs(res.result or {}) do
-- 			if r.edit then
-- 				vim.lsp.util.apply_workspace_edit(r.edit)
-- 			else
-- 				vim.lsp.buf.execute_command(r.command)
-- 			end
-- 		end
-- 	end
-- end

-- vim.cmd [[autocmd BufWritePre <buffer> lua org_imports(1000)]]

-- Format on save
-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
