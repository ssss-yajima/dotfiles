
# 事前にhomebrewからnodebrewをインストールすること
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

mkdir -p ~/.nodebrew/src
nodebrew install-binary latest
