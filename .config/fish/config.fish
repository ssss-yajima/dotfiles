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


# theme/bobthefish
set -g theme_newline_cursor yes
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g theme_color_scheme terminal-dark
set -g theme_newline_prompt '$ '

# ------------ alias -----------------

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

# awsume
alias awsume="zsh (pyenv which awsume)"


# ------------ commands -----------------

# history + peco
if type -q peco
    function peco_select_history_order
    history|peco $peco_flags|read foo
    if [ $foo ]
        commandline $foo
    else
        commandline ''
    end
    end
end
# ghq + peco
if type -q peco && type -q ghq
    function ghq_peco_repo
    set selected_repository (ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_repository" ]
        cd $selected_repository
        echo " $selected_repository "
        commandline -f repaint
    end
    end
end

function fish_user_key_bindings
    bind \cr peco_select_history_order
    bind \cg ghq_peco_repo
end
