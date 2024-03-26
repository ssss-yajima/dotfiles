#!/usr/bin/env fish

cd (dirname (status -f)) && source init.fish

set NODE_VERSION "20.11.1"

brew install nodenv

nodenv install $NODE_VERSION -s && nodenv global $NODE_VERSION
source-config

cd $DOT_PATH
for p in (cat npm-packages)
    if test -n $p
        npm install -g $p
    end
end
