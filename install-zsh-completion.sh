#!/bin/zsh

mkdir -p  ~/.zsh/completion/
curl -O https://raw.github.com/git/git/master/contrib/completion/git-completion.bash 
mv git-completion.bash ~/.zsh/completion/git-completion.bash

curl -O https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh 
mv git-completion.zsh ~/.zsh/completion/git-completion.zsh

mv ~/.zsh/completion/git-completion.zsh ~/.zsh/completion/_git
