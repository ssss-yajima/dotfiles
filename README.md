# dotfiles


## Setup


### Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### Setup tools

```
# Install git
brew install git

# Install fish
brew install fish
chsh -s $(which fish)

# Run install script
curl -fsSL https://raw.githubusercontent.com/hayashikun/dotfiles/master/setup.fish | fish
```

## Others

```bash
# Basic
brew install --cask google-japanese-ime

# Dev Tools
brew install --cask iterm2
brew install --cask docker
brew install --cask visual-studio-code

# Communication
brew install --cask zoom
brew install --cask slack

# Utils
brew install --cask raycast # Import raycast/Raycast xxxxx rayconfig. Password is in GitHub Secret.
brew install --cask skitch
brew install --cask notion
```

