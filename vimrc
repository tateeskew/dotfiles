runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

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

set undodir=~/.vim/tmp/undo/      " undo files
set backupdir=~/.vim/tmp/backup/  " backups
set directory=~/.vim/tmp/swap/    " swap files

" Make those folders automatically if they don't already exist.
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

" Some search stuff I like
set ignorecase
set smartcase

set incsearch
set showmatch
set hlsearch

" Clear a serach by typing (,space)
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
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" System clipboard interaction.  Mostly from:
" https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv

" Easier to type, I hate the normal bindings 
noremap H ^
noremap L $
vnoremap L g_

" This sets the comment string for sls (SALT) files to pound sign. The
" " 'commentary' plugin uses this
autocmd FileType sls set commentstring=#\ %s

" jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                          \ exe "normal g'\"" | endif
