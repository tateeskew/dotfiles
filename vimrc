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

nnoremap j gj
nnoremap k gk

" Map jj to ESC to exit
inoremap jj <ESC>

" Open new split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

" Let's navigate through our windows a little better
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l