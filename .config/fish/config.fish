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


alias tf='terraform'
alias ume='awsume'
alias umel='awsume -l|fzf|awk "{print \$1,\$6}"'
alias umels='awsume $(awsume -l|fzf|awk "{print \$1}")'

alias f='fzf --preview "bat --color \"always\" {}"'
export FZF_DEFAULT_OPTS='--height 50% --reverse --border --ansi'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --color=always'

export ENHANCD_HOOK_AFTER_CD=ls

# ghq + fzf
if type -q fzf && type -q ghq
    function ghq_fzf_repo
        set selected_repository (ghq list -p | fzf --query "$LBUFFER" --preview "eza --icons -T -L 1")
        if [ -n "$selected_repository" ]
            cd $selected_repository
            echo " $selected_repository "
            commandline -f repaint
        end
    end
end

function fzf_recentd
    z -l | fzf | awk '{ print $2 }' | read recentd
    cd $recentd
end

function fish_user_key_bindings
    bind \cg ghq_fzf_repo # Ctrl + G
    # 最近見たディレクトリに移動
    bind \cx\cr fzf_recentd
end


direnv hook fish | source
set -x EDITOR code
