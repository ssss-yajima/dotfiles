# #Show fish logo
# if type -q fish_logo
#     fish_logo
# end

# for M1 mac
if test (uname -sm) = "Darwin arm64"
    eval (/opt/homebrew/bin/brew shellenv)
end

# nodenv
if type -q nodenv
    eval (nodenv init - | source)
end
# pyenv
if type -q pyenv
    pyenv init --path | source
    pyenv init - | source
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# python for m1 mac
# set -gx LDFLAGS "-L$(xcrun --show-sdk-path)/usr/lib"
set -gx LDFLAGS -L/opt/homebrew/opt/zlib/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/zlib/include
set -gx PKG_CONFIG_PATH /opt/homebrew/opt/zlib/lib/pkgconfig

# theme/bobthefish
set -g theme_newline_cursor yes
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g theme_color_scheme terminal-dark
set -g theme_newline_prompt '$ '
set -g fish_prompt_pwd_dir_length 0
set -g theme_use_abbreviated_branch_name no
set -g theme_display_node yes
set -g theme_display_git yes

# ------------ alias -----------------

alias date='gdate'
alias unzip='/opt/homebrew/opt/unzip/bin/unzip'

alias cat='bat'
alias ls='eza --icons --git'
alias la="ls -lah"
alias diff='delta'

# git
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
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

alias cdk="npx cdk"
alias tf='terraform'
alias ume='awsume'
alias umel='awsume -l|fzf|awk "{print \$1,\$6}"'
alias umels='awsume $(awsume -l|fzf|awk "{print \$1}")'

direnv hook fish | source
set -x EDITOR code
