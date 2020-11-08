# =========== config ===========
# 色を使用出来るようにする
autoload -Uz colors
colors
# コマンドのスペルを訂正する
setopt correct
# 高機能なワイルドカード展開を使用する
setopt extended_glob
# Ctrl+Dでzshを終了しない
setopt ignore_eof

# --- history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history
# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# --- cd
# cd なしでもディレクトリ移動
setopt auto_cd
# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups
#cdしたあとで、自動的に ls する
#function chpwd() { ls -1 }

# --- completion
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zsh-completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# --- prompt
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "(%F{green}%c%u%b%f)"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }


PROMPT='%{${fg[green]}%}[%d]%{${reset_color}%}${vcs_info_msg_0_}
%# '
#RPROMPT='%n@%m'


# =========== functions =========
# Ctrl-R のヒストリ検索にpeco利用
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ghqで取得したリポジトリへの移動
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^V' peco-src

# GitHub APIを利用して自分のリポジトリ一覧を出力
function gh-user-repos(){
  echo "<<GitHub ... /user/repos>>>"
  curl -su :$GITHUB_MYTOKEN $GITHUB_BASEURL/user/repos|jq -r ".[].name"
}
zle -N gh-user-repos

# GitHub APIから取得したリポジトリ一覧をpecoで検索してghq get
functions ghq-get-my-repos(){
  gh-user-repos | peco | ghq get
}
zle -N ghq-get-my-repos
bindkey '^X^G' ghq-get-my-repos

#========= ailias ============
alias ..='cd ..'
alias _='cd -'
alias ls='ls -FG'
alias ll='ls -lFGh '
alias la='ls -laFGh'

# C で標準出力をクリップボードにコピーする : http://mollifier.hatenablog.com/entry/20100317/p1
alias -g C='| pbcopy'
# peco
alias -g P='| peco'

# zshrc
alias zsh='code ~/.zshrc'
alias szsh='source ~/.zshrc'

# git
alias g='git'
alias ga='git add'
alias gs='git status -sb'
alias gc='git commit'

# python3
alias python=python3
alias pip=pip3

# docker
alias d='docker'
alias d-c='docker-compose'

# Zenn.dev
alias zenn-article='npx zenn new:article'
alias zenn-book='npx zenn new:book'
alias zenn-prv='npx zenn preview'

# --- peco
# pecoに流す系はp始まりとする
alias pcd='cd $(ghq list -p | peco)'
bindkey '^G' pcd
alias pls='ls -alt|peco'
# pecoでsshするalias - Qiita http://qiita.com/d6rkaiz/items/46e9c61c412c89e84c38
alias sshp='ssh $(grep "^Host" ~/.ssh/config|peco|awk "{print \$2}")'
# ghq + peco
alias pghq-list='ghq list -p | peco'
# ghq + peco + VSCode
alias pcode-ghq='code $(ghq list -p | peco)'
# git + peco
alias pgit-co='git checkout `git branch | peco`'


# ======= 環境変数 =========
# GO
export GOPATH=$HOME/go
export GO111MODULE=on

# Python
export PATH=/usr/local/bin:$PATH

# GCP
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/syajima/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/syajima/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/syajima/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/syajima/Downloads/google-cloud-sdk/completion.bash.inc'; fi


