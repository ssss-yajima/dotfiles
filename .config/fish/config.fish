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

set -gx FZF_DEFAULT_OPTS '--height 50% --reverse --border'


# ------------ alias -----------------

alias date='gdate'
alias unzip='/opt/homebrew/opt/unzip/bin/unzip'

alias cat='bat'
alias ls='eza --icons --git'
alias la="ls -lah"
alias diff='delta'
alias ymd="date '+%Y%m%d'"

# git
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
# docker
alias d='docker'

# cude/cursor
alias c='cursor'

alias pn='pnpm'

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
alias ume='awsume -a -o '
alias umel='awsume -l|fzf|awk "{print \$1,\$7}"'
alias umels='awsume -a -o $(awsume -l|fzf|awk "{print \$1}")'

direnv hook fish | source
set -x EDITOR code
/Users/shinya_yajima/.local/bin/mise activate fish | source


# ClaudeCode
alias cc="claude"
alias ccc="claude --continue"
alias cccc="cursor ~/.claude"
alias yolo="claude --dangerously-skip-permissions"
alias yoloc="claude --continue --dangerously-skip-permissions"

#mise
alias m='mise'
alias mr='mise run'
alias mrs='mise tasks'


# tinker関数 - プロジェクトを作成して自動的にそのディレクトリに移動
function tinker
    set workroom_dir ~/go/src/github.com/ssss-yajima/workroom
    cd $workroom_dir
    set project_path (./scripts/tinker.sh $argv)
    if test $status -eq 0
        cd $workroom_dir/$project_path
        echo "Created and moved to: $project_path"
    else
        echo "Failed to create project"
    end
end

# 短縮版
function tk
    tinker $argv
end

alias wk="cd ~/go/src/github.com/ssss-yajima/workroom/workbench;la;echo '>>> run tk to create work folder'"

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
