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

alias cat='bat'
alias ls='exa'
alias la="ls -lah"
alias diff='delta'

# git
alias g='git'
alias ga='git add'
alias gc='git commit'

# python
alias python=python3
alias pip=pip3

# gh
alias issue='gh issue create'
alias issueme='gh issue create --assignee @me'
alias issues='gh issue list'
alias pr='gh pr create --assignee @me'


# ------------ commands -----------------

# history + peco
if type -q peco
    function peco_select_history_order
        history | peco $peco_flags | read foo
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

# z + peco : change directory
function peco_z
    set -l query (commandline)

    if test -n $query
        set peco_flags --query "$query"
    end

    z -l | peco $peco_flags | awk '{ print $2 }' | read recent
    if [ $recent ]
        cd $recent
        commandline -r ''
        commandline -f repaint
    end
end

# Key Bindings
function fish_user_key_bindings
    bind \cr peco_select_history_order # Ctrl + R
    bind \cg ghq_peco_repo # Ctrl + G
    # bind \x1b peco_z                   # Ctrl + [
end
eval (direnv hook fish)
set -x EDITOR code
