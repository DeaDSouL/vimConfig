syntax on
syntax enable

setlocal tabstop=8       " show existing tab with 4 spaces width
setlocal softtabstop=4
setlocal shiftwidth=4    " when indenting with '>', use 4 spaces width
setlocal textwidth=79    " ensure your line length doesn’t go beyond 80 characters
setlocal expandtab       " On pressing tab, insert 4 spaces
setlocal autoindent      " Automatically set the indent of a new line (local to buffer)
setlocal si              " smartindent (local to buffer)
setlocal modeline

filetype plugin indent on

