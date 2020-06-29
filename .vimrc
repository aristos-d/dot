" Use Vim defailts (unnecessary)
set nocompatible

" Tab related stuff
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display line numbers
set number

" Auto-indentation
set ai
set smartindent

" Filetype detection and indentation
filetype on
filetype plugin on
filetype indent on

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" File explorer related stuff
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
