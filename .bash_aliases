alias ll='ls -lah'
alias ls='ls -G'
alias cdw='cd $HOME/workspaces'
alias cdt='cd $HOME/tools'
alias python='python3'
alias pip='pip3'



alias gbr='git remote -v | awk "{print \$2}" | uniq | sed -e "s_:_/_" | sed -e "s_git@_https://_" | xargs open'

alias gbp='git branch -a | peco'
