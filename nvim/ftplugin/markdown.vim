" Markdown settings.
"
" This file contains settings for Markdown files. Specifically, it inserts a
" new bullet point or todo list item when pressing <enter> in insert mode, or
" o in normal mode. It does this by tweaking the settings for Vim's builtin
" comments feature. The comments feature e.g. auto inserts a leading `//` in
" code files. Here, we (ab)use it to insert bullet points for us in Markdown
" files.
"
" Useful documentation:
" :h 30.6
" :h format-comments
" :h fo-table

" Only do this when not done yet for this buffer (see :h ftplugin)
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal autoindent

" Automatically insert the current comment leader after hitting <Enter> in
" Insert mode.
setlocal formatoptions+=r

" Do not auto-wrap comments using textwidth, (not) inserting the current comment
" leader automatically.
setlocal formatoptions-=c

" Automatically insert the current comment leader after hitting 'o' or 'O' in
" Normal mode.
setlocal formatoptions+=o

" Accept various markers as bullets
setlocal comments=b:-\ [\ ],b:-\ [x],b:*,b:+,b:-,
