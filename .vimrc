" Use Vim defaults
set nocompatible

" Tab handling
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display
set number
set laststatus=2

" Indentation
set autoindent
set smartindent

" Filetype detection and indentation
filetype on
filetype plugin on
filetype indent on

" Syntax highlighting
syntax enable

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Tell vim about the escape sequences used by tmux
if exists('$TMUX')
    map <ESC>[1;5A <C-Up>
    map <ESC>[1;5B <C-Down>
    map <ESC>[1;5D <C-Left>
    map <ESC>[1;5C <C-Right>
    map! <ESC>[1;5A <C-Up>
    map! <ESC>[1;5B <C-Down>
    map! <ESC>[1;5D <C-Left>
    map! <ESC>[1;5C <C-Right>
endif

" File explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_winsize = 20
nmap <tab> :Lexplore<cr>:wincmd =<cr>

if !exists(":FormatC")
    command FormatC :%!clang-format
endif

" XML Formatter using Python 3
if !exists(":FormatXML")
    command FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
endif

" Status line helper functions
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" Status line format
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=\%#StatusLine#
set statusline+=\ %f
set statusline+=\ %r
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %l,%c
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}/%{&fileformat}
set statusline+=\ %p%%
set statusline+=\ 

colorscheme onedark
