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

set pumheight=10
nnoremap Y y$

"----------
" カラースキーム
"----------
colorscheme molokai
syntax on
set paste

set ft=zsh:

set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ここに入れたいプラグインを記入

NeoBundle 'scrooloose/syntastic'


call neobundle#end()
filetype plugin indent on

