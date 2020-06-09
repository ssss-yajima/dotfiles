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



# Gitコマンド補完
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash