"Powerline Arch Python3
let g:powerline_pycmd = 'py3'

colorscheme ron 

set wildmenu
set nocompatible
set ruler
set history=1000
set undofile
set undoreload=10000
filetype plugin on
filetype indent on
set ls=2

" Gotta have the indention stuffs for Python
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab

" Enable syntax already, would you.
syntax enable

" Setup swap, backup and persistent undoj

set noswapfile
set backup

set undodir=$HOME/vim/undo/      " undo files
set backupdir=$HOME/vim/backup/  " backups
set directory=$HOME/vim/swap/    " swap files

" Make folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Set leader key to the comma instead of backslash
let mapleader = ","

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Some search stuff I like
set ignorecase
set smartcase

set incsearch
set showmatch
set hlsearch

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>
highlight WhiteOnRed ctermbg=green ctermfg=white

" highlight the search match in red...
    function! HLNext (blinktime)
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction

" Clear a search by typing (,space)
nnoremap <leader><space> :noh<cr>

" Move around to bracket pairs using TAB instead of %
nnoremap <tab> %
vnoremap <tab> %

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Easymotion - leader f - jump anywhere
nnoremap f H:call EasyMotion#WB(0, 0)<CR>

" Map jj to ESC to exit
inoremap jj <ESC>

" Open new split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

" Let's navigate through our windows a little better
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Would you please paste correctly
nnoremap <leader>v :set invpaste paste?<CR>
imap <leader>v <C-O>:set invpaste paste?<CR>
set pastetoggle=<leader>v

" System clipboard interaction.  Mostly from:
" Use the + register if on Linux and the * register if using OSX
noremap <leader>y "+y
noremap <leader>p :set paste<CR>"+p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"+P<CR>:set nopaste<CR>
vnoremap <leader>y "+ygv

" Easier to type, I hate the normal bindings 
noremap H ^
noremap L $
vnoremap L g_

" This sets the comment string for sls (SALT) files to pound sign. The
" " 'commentary' plugin uses this
autocmd FileType sls set commentstring=#\ %s
autocmd FileType tf set commentstring=#\ %s

" jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                          \ exe "normal g'\"" | endif
