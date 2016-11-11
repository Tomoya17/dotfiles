" Basic setting {
"文字コードをUFT-8に設定
set fenc=utf-8
"バックアップファイルを作らない
set nobackup
"スワップファイルを作らない
set noswapfile
"バッファが編集中でもその他のファイルを開けるように
set hidden
"入力中のコマンドをステータスに表示する
set showcmd
"新しい行のインデントを現在行と同じにする
set autoindent
"vi互換をオフする
set nocompatible
"行番号を表示する
set number
"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"移動系
"左右のカーソル移動で行を跨いで移動
"set whichwrap=b,s,h,l,<,>,[,],~
"スクロールの余裕を確保する
set scrolloff=5
"折り返し表示の際にも表示行単位で移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"編集系
"タブの代わりに空白を使う
set expandtab
"タブを表示するときの幅
set tabstop=4
"タブを挿入するときの幅
set shiftwidth=4
"編集中のファイルが変更されたら自動で読み直す
set autoread
"新しい行を作った時に高度な自動インデントを行う
set smarttab

"検索機能系
B
"大文字小文字を無視
set ignorecase
"ignorecaseと組み合わせて、小文字入力の時のみ大文字小文字無視
set smartcase
"インクリメンタルサーチ
set incsearch
"検索結果をハイライト
set hlsearch
"ESC連打でハイライトを消す
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

"見た目系
"変換候補で一度に表示される数を設定する
set pumheight=10
"下部のステータスラインを常に表示
set laststatus=2
"スペルチェック機能を使う
set spell
set spelllang=en,cjk""日本語を除外
"ソースコードを折りたたみ表示する
"set foldmethod=marker
"現在の行をハイライト
set cursorline
hi clear CursorLine "上と合わせて行番号のみハイライト

" clipbord
set clipboard+=unnamed

set paste
set ft=zsh:

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^a
nnoremap Y y$

"NeoBundle
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

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" solarized
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'


call neobundle#end()

" Required:
filetype plugin indent on

"let g:solarized_termcolors=256
let g:solarized_termtrans = 1
syntax enable
set background=dark
colorscheme solarized 
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
 NeoBundleCheck


