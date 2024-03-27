# ========================== 環境変数 =================================
# Python
export PATH=/usr/local/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH
eval "$(nodenv init -)"


# go
export PATH=$HOME/go/bin:$PATH

# Serverlessでconfigを認識させる
# export AWS_SDK_LOAD_CONFIG=1

# ====================== Plugin ============================
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'

# ===================  補完  ================================
# zsh-completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# # 補完で小文字でも大文字にマッチさせる
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# # AWS
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# compdef awsume
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
# # コマンドのスペルを訂正する
setopt correct
# # 高機能なワイルドカード展開を使用する
setopt extended_glob
# # Ctrl+Dでzshを終了しない
setopt ignore_eof

# # --- history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# # share .zshhistory
setopt inc_append_history
setopt share_history
# # 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups
# # 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# # スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# # ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# # --- cd
# # cd なしでもディレクトリ移動
# setopt auto_cd
# # cd [TAB] で以前移動したディレクトリを表示
# setopt auto_pushd
# # pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
# setopt pushd_ignore_dups
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
# autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
# add-zsh-hook chpwd chpwd_recent_dirs

# cdr の設定
# zstyle ':completion:*' recent-dirs-insert both
# zstyle ':chpwd:*' recent-dirs-max 500
# zstyle ':chpwd:*' recent-dirs-default true
# zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
# zstyle ':chpwd:*' recent-dirs-pushd true

#============================= ailias ===========================
alias cat='bat'
alias ls='eza --icons --git'
alias la="ls -lah"
alias diff='delta'
alias date='gdate'

alias unzip='/opt/homebrew/opt/unzip/bin/unzip'


# git
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gst='git status'
alias gsw='git switch'

# docker
alias d='docker'

# python
alias python=python3
alias pip=pip3
# gh
alias ghw='gh repo view --web'
alias issue='gh issue create'
alias issueme='gh issue create --assignee @me'
alias issues='gh issue list'
alias pr='gh pr create --assignee @me'
alias prs='gh pr list'
alias prm='gh pr merge'
alias sug='gh copilot suggest'
alias exp='gh copilot explain'

alias tf='terraform'
alias ume='awsume'
alias umel='awsume -l|fzf|awk "{print \$1,\$6}"'
alias umels='awsume $(awsume -l|fzf|awk "{print \$1}")'

