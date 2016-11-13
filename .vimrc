" Basic setting {{
set fenc=utf-8
set nobackup
set noswapfile
set hidden
set showcmd
set autoindent
set number
set showmatch

" Move
"set whichwrap=b,s,h,l,<,>,[,],~
set scrolloff=5
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Tabline
set expandtab
set tabstop=4
set shiftwidth=4
set autoread
set smarttab

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" Display setting{{
set pumheight=10
set laststatus=2
set spell
set spelllang=en,cjk
"set foldmethod=marker
set cursorline
hi clear CursorLine 

" Clipbord
set clipboard+=unnamed

set paste
set ft=zsh:


" NeoBundle{{{
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" My Bundles here
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" NERDTree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'


call neobundle#end()
" Required:
filetype plugin indent on
"}}}

"solarized
"let g:solarized_termcolors=256
let g:solarized_termtrans = 1
syntax enable
set background=dark
colorscheme solarized 
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
 NeoBundleCheck


" NERDTree
nnoremap <silent><C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


