#!/usr/bin/env fish

cd (dirname (status -f)) && source init.fish

set PYTHON_VERSION "3.11.7"

brew install pyenv

cd $DOT_PATH

pyenv install $PYTHON_VERSION -s && pyenv global $PYTHON_VERSION
source-config

pip install -U -r pip-packages
