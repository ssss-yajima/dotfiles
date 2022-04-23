#!/usr/bin/env fish

cd (dirname (status -f)) && source init.fish

set RUBY_VERSION "3.1.2"

brew install rbenv

cd $DOT_PATH

rbenv install $RUBY_VERSION -s && rbenv global $RUBY_VERSION

