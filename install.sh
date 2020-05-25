#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git
brew install ghq
brew install peco
brew install jq
brew install zsh-git-prompt
brew install exa
brew install fd
brew install bat


brew install nodebrew 
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
nodebrew install stable

curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java
sdk install gradle
sdk install scala
sdk install sbt

echo 'export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Duser.timezone=UTC"' >> ~/.bash_profile

brew install python3
brew install go

