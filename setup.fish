#!/usr/bin/env fish

cd (dirname (status -f)) && source init.fish

for cmd in git curl
    if not type -q $cmd
        echo $cmd "is required."
        exit 1
    end
end

if not test -d $DOT_PATH
    git clone git@github.com:y-megane/dotfiles.git $DOT_PATH
end


link-file .gitconfig .gitignore_global .zshrc .config/fish/config.fish .config/fish/fish_plugins .vimrc .zshrc

source-config

# make chache dir
if not test -d $CACHE_PATH
    mkdir $CACHE_PATH
end

# install cli tools with brew
brew-install yq jq pwgen tree gh ghq bat git-delta eza coreutils unzip direnv fzf

# fisher
if not test -e $HOME/.config/fish/functions/fisher.fish
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end
fisher install (cat $DOT_PATH/.config/fish/fish_plugins)

# powerline
cd $CACHE_PATH
if not test -e $CACHE_PATH/font
    git clone https://github.com/powerline/fonts.git --depth=1
end
cd fonts && git pull && ./install.sh

# target
set TARGETS python node
if test -f $DOT_PATH/.target
    set TARGETS (cat $DOT_PATH/.target)
end

for t in $TARGETS
    cd $DOT_PATH && source setup-$t.fish
end

source-config
