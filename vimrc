"Powerline Arch Python3
let g:powerline_pycmd = 'py3'

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:gruvbox_italic=1
set bg=dark
colorscheme gruvbox

set wildmenu
set nocompatible
set ruler
set history=1000
set undofile
set undoreload=10000
filetype plugin on
filetype indent on
set laststatus=2
set encoding=utf8

" Gotta have the indention for defaults
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
set fileformat=unix

" Set specifics for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Enable syntax already, would you.
syntax enable

" Setup swap, backup and persistent undo
set noswapfile
set backup

set undodir=$HOME/.vimundo/      " undo files
set backupdir=$HOME/.vimbackup/  " backups
set directory=$HOME/.vimswap/    " swap files

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

" Save a file as root (,W) or :w!!
noremap <leader>W :w !sudo tee % > /dev/null<CR>
cnoremap w!! :w !sudo tee % > /dev/null<CR>

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

" Easymotion  <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Nertree - leader o - open Nerdtree
map <leader>o :NERDTreeToggle<CR>

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

" let g:indentLine_setColors = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" This sets the comment string for sls (SALT) files to pound sign. The
" " 'commentary' plugin uses this
autocmd FileType sls set commentstring=#\ %s
autocmd FileType tf set commentstring=#\ %s

" jump to last position of buffer when opening
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                          \ exe "normal g'\"" | endif

set encoding=UTF-8
