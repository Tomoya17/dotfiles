" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
"vi互換をオフする
set nocompatible
"タブの代わりに空白文字を指定する
set expandtab
"行番号を表示する
set number
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
"新しい行を作った時に高度な自動インデントを行う
set smarttab

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^a
set pumheight=10
nnoremap Y y$

"----------
" カラースキーム
"----------

set paste
set ft=zsh:

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


"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'ujihisa/unite-colorscheme'


call neobundle#end()

 " Required:
 filetype plugin indent on

"let g:solarized_termcolors=256
let g:solarized_termtrans = 1
syntax enable
set background=dark
colorscheme solarized 


 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


