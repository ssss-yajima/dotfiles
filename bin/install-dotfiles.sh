DOT="$HOME/ghq/github.com/y-megane/dotfiles"

ln -sf $DOT/.bashrc ~/.bashrc
ln -sf $DOT/.bashrc ~/.bash_profile
ln -sf $DOT/.zshrc ~/.zshrc
ln -sf $DOT/.vimrc ~/.vimrc
ln -sf $DOT/.ssh/config ~/.ssh/config
# VSCode
ln -sf $DOT/VSCode/User/settings.json ~/Library/ApplicationSupport/Code/User/settings.json
ln -sf $DOT/VSCode/User/snippets/ ~/Library/ApplicationSupport/Code/User/snippets/
