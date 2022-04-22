DOT="$HOME/go/src/github.com/y-megane/dotfiles"

ln -sf $DOT/.zshrc ~/.zshrc
ln -sf $DOT/.vimrc ~/.vimrc
ln -sf $DOT/.ssh/config ~/.ssh/config
ln -sf $DOT/.snippets ~/.snippets

mkdir ~/.config/peco
ln -sf $DOT/peco/config.json ~/.config/peco/config.json

