#!/usr/bin/env fish

cd (dirname (status -f)) && source init.fish

brew install --cask karabiner-elements
link-file .config/karabiner/karabiner.json
