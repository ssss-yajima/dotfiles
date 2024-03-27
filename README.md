# dotfiles

## Setup

### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Setup tools

```bash
# Install git
brew install git

# Install fish
brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s $(which fish)

# Run install script
curl -fsSL https://raw.githubusercontent.com/ssss-yajima/dotfiles/master/setup.fish | fish
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

- [英かな](https://ei-kana.appspot.com/)
- Todoist
- Arc Browswer
- Editor Font - [Moralerspace](https://github.com/yuru7/moralerspace)
- Terminal Font - [HackGen35ConsoleNF-Regular](https://github.com/yuru7/moralerspace?tab=readme-ov-file)

## Import settings

- GoogleIME
- Raycast
- iTerm2
