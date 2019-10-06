#!/usr/bin/env bash

brew install git
brew install ghq
brew install peco
brew install jq

brew install nodebrew 
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
nodebrew install stable

curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java
sdk install gradle
sdk install scala
sdk install sbt

brew install python


