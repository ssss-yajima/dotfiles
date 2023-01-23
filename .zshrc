# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Fig pre block. Keep at the top of this file.
# # ========================== 環境変数 =================================
# Python
export PATH=/usr/local/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# go
export PATH=$HOME/go/bin:$PATH

# Serverlessでconfigを認識させる
export AWS_SDK_LOAD_CONFIG=1

# ====================== Plugin ============================
plugins=(
    # other plugins...
    zsh-autosuggestions
)

# ===================  補完  ================================
# zsh-completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit && compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# AWS
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

#compdef awsume
# _arguments "*: :($(awsume-autocomplete))"

# ======================== プロンプト =========================
# pyenvのバージョンをプロンプトに表示
# https://yonchu.hatenablog.com/entry/2014/09/03/211008
# source ~/work/zsh/zsh-python-prompt/zshrc.zsh

# --- prompt
# PROMPT='%{${fg[green]}%}[%d]%{${reset_color}%}${vcs_info_msg_0_}
# %# '
#RPROMPT='%n@%m'

# pyenvのバージョンをプロンプトに表示
# https://yonchu.hatenablog.com/entry/2014/09/03/211008
# RPROMPT='$ZSH_PYTHON_PROMPT'

# --- vcs_info
# autoload -Uz vcs_info
# setopt prompt_subst

# ================================================================

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

# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "(%F{green}%c%u%b%f)"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
# precmd(){ vcs_info }

# --- cdr
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# cdr の設定
# zstyle ':completion:*' recent-dirs-insert both
# zstyle ':chpwd:*' recent-dirs-max 500
# zstyle ':chpwd:*' recent-dirs-default true
# zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
# zstyle ':chpwd:*' recent-dirs-pushd true

# ============================== functions ================================
# Ctrl-R のヒストリ検索にpeco利用
function peco-history-selection() {
    BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ghqで取得したリポジトリへの移動
function peco-src() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^V' peco-src

# cdr + peco
function peco-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^Y' peco-cdr

#============================= ailias ===========================

# C で標準出力をクリップボードにコピーする : http://mollifier.hatenablog.com/entry/20100317/p1
alias -g C='| pbcopy'
# peco
alias -g P='| peco'

# zshrc
alias zsh='code ~/.zshrc'
alias szsh='source ~/.zshrc'

alias cat='bat'
alias ls='exa'
alias la="ls -lah"
alias diff='delta'

# git
alias g='git'
alias master='git switch master'

# python
alias python=python3
alias pip=pip3

# gh
alias issue='gh issue create'
alias issueme='gh issue create --assignee @me'
alias issues='gh issue list'
alias pr='gh pr create --assignee @me'

# Fig post block. Keep at the bottom of this file.
#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
