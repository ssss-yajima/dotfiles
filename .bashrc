# bashrc

# completion for sudo command
complete -cf sudo

#========= ailias ============
alias ..='cd ..'
alias _='cd -'
alias ls='ls -FG'
alias ll='ls -lFGh '
alias la='ls -laFGh'

# git
alias g='git'

# hub
alias git='hub'
alias gi='git issue'
alias gic='git issue create -m'

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
