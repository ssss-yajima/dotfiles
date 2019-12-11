DOT="$HOME/develop/dotfiles"
ln -sf $DOT/.bashrc ~/.bashrc
ln -sf $DOT/.vimrc ~/.vimrc
ln -sf $DOT/.ssh/config ~/.ssh/config
# VSCode
ln -sf $DOT/VSCode/User/settings.json ~/Library/ApplicationSupport/Code/User/settings.json 
ln -sf $DOT/VSCode/User/snippets/markdown.json ~/Library/ApplicationSupport/Code/User/snippets/markdown.json
ln -sf $DOT/VSCode/User/snippets/python.json ~/Library/ApplicationSupport/Code/User/snippets/python.json
