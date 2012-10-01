runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on

" Gotta have the indention stuffs for Python
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab

" Enable syntax already, would you.
syntax enable

set nocompatible
set ruler

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

" This sets the comment string for sls (SALT) files to pound sign. The
" " 'commentary' plugin uses this
autocmd FileType sls set commentstring=#\ %
