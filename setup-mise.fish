#!/usr/bin/env fish
brew install mise

mise use -g usage
mise completion fish >~/.config/fish/completions/mise.fish
