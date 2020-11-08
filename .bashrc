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

#========= pecp ==========
# Ctrl-R のヒストリ検索にpeco利用
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'

