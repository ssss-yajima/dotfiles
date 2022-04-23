#!/usr/bin/env fish

cd (dirname (status -f)) && source init.fish

set TF_VERSION "1.1.3"

brew install tfenv
tfenv install $TF_VERSION
tfenv use $TF_VERSION
