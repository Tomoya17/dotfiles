########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
# PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~
# %# "
PROMPT="
[%n@Mac] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?! (=ﾟ-ﾟ)ﾉﾆｬｰﾝ♪ <!(*;-;%)? <)%{${reset_color}%} "


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加


#LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
        RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# alias (エイリアス)

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# 修士論文
alias masterresearch='cd /Users/tomoya/Documents/修士論文'

alias paiza='cd /Users/tomoya/Desktop/paiza'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
   # Mac
   alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
   # Linux
   alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
   # Cygwin
   alias -g C='| putclip'
fi



########################################
# OS 別の設定
case ${OSTYPE} in
   darwin*)
      #Mac用の設定
      export CLICOLOR=1
      alias ls='ls -G -F'
      ;;
   linux*)
      #Linux用の設定
      alias ls='ls -F --color=auto'
      ;;
esac

# vim:set ft=zsh

# syntax highlightの設定
if [ -f /Users/tomoya/.zsh/zsh-syntax-highlighting.zsh ]; then
    source /Users/tomoya/.zsh/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fi

alias LocalizeLidar='cd ~/Documents/UniversalMap/LiDAR位置推定アルゴリズム/tomoya_localize_laser'


#Opencvのchamfer matchingのため
#dyld: 動的ライブラリのPATHの設定
#DYLD_LIBRARY_PATH=/usr/local/Cellar/opencv/2.4.13.1/lib
#export DYLD_LIBRARY_PATH

#DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/Cellar/jpeg/8d/lib/
#export DYLD_LIBRARY_PATH

#DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib
#export DYLD_LIBRARY_PATH


# for Pokemon-Terminal
unset PYTHONPATH

PATH=/Users/tomoya/.Pokemon-Terminal:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/TeX/texbin:/usr/local/share/dotnet:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Wireshark.app/Contents/MacOS:/Users/tomoya/.pyenv/shims/python

#pokemon Pikachu
#pokemon Exeggutor
pokemon Lapras
#pokemon Diglett
#pokemon Raichu

#pokemon Snorlax


#pythonにおいてのopencvのpath
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"


# tab補完で出したファイルなどを選択
zmodload -i zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=2

# 補完時にhjklで選択
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char



