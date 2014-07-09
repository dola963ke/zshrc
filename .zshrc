# -------------------------------------
# 環境変数
# -------------------------------------

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# エディタ
#export EDITOR=/usr/local/bin/vim
export EDITOR=/usr/local/Cellar/vim/7.4.273/bin/vim
bindkey -v

# ページャ
export PAGER=/usr/local/bin/vimpager
export MANPAGER=/usr/local/bin/vimpager


# -------------------------------------
# zshのオプション
# -------------------------------------

## command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

## 補完機能の強化
autoload -U compinit
compinit
zstyle ':completion:*' menu select

## 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

# ビープを鳴らさない
setopt nobeep

## 色を使う
setopt prompt_subst

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# 補完
## タブによるファイルの順番切り替えをしない
unsetopt auto_menu

# cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
setopt auto_pushd

# ディレクトリ名を入力するだけでcdできるようにする
setopt auto_cd

# -------------------------------------
# パス
# -------------------------------------

# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
    $HOME/bin(N-/)
	/usr/local/Cellar/vim/7.4.273/bin/vim
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
	/usr/lib(N-/)
	/usr/texbin
    $path
)

# -------------------------------------
# プロンプト
# -------------------------------------
autoload -U promptinit
promptinit

autoload -U colors && colors
PROMPT='<%{$fg_bold[magenta]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%}>$ '
RPROMPT='[%F{green}%d%f]'

# -------------------------------------
# エイリアス
# -------------------------------------

# vim
alias vi="vim"

# ls
export LSCOLORS=exfxcxdxbxexgedabagacad
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"


# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# locate
alias updatedb='sudo /usr/libexec/locate.updatedb*'

# Applications
alias mjograph='open -a MjoGraph'
alias firefox='open -a Firefox'
alias pdf='open -a Preview *.pdf'

# gcc
alias gcc="gcc-4.9"

# added by Anaconda 1.9.2 installer
export PATH=$PATH:"/Users/itoh/anaconda/bin"


# -------------------------------------
# その他
# -------------------------------------

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }

# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
 }
