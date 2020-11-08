# bashrc

# completion for sudo command
complete -cf sudo

#========= ailias ============
alias ..='cd ..'
alias _='cd -'
alias ls='ls -FG'
alias ll='ls -lFGh '
alias la='ls -laFGh'

# python3
alias python=python3
alias pip=pip3

# docker
alias d='docker'
alias d-c='docker-compose'

# bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Zenn.dev
alias zenn-article='npx zenn new:article'
alias zenn-book='npx zenn new:book'
alias zenn-prv='npx zenn preview'

#========= peco ==========
# Ctrl-R のヒストリ検索にpeco利用
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}

# 標準コマンド + peco
alias pcd='cd $(ghq list -p | peco)'
alias pls='ls -alt|peco'

# pecoでsshするalias - Qiita http://qiita.com/d6rkaiz/items/46e9c61c412c89e84c38
alias pssh='ssh $(grep "^Host" ~/.ssh/config|peco|awk "{print \$2}")'

# ghq + peco
alias pghq='ghq list -p | peco'
# ghq + peco + VSCode
alias pcode='code $(ghq list -p | peco)'

# git + peco
alias pco='git checkout `git branch | peco`'


#============== bind ============
bind -x '"\C-r": peco-select-history'
bind -x '"\C-g": pcd'

