
source ~/.zsh_aliases
setopt IGNOREEOF

#for completion
fpath=(/usr/local/share/zsh-completions $fpath)
if [ -f $(brew --prefix)/etc/zsh_completion ]; then
  source $(brew --prefix)/etc/zsh_completion
fi



# git ps1
#source /usr/local/etc/zsh_completion.d/git-prompt.sh
#source /usr/local/etc/zsh_completion.d/git-completion.zsh
GIT_PS1_SHOWDIRTYSTATE=true
PROMPT='[%~:%n] %# '


# sbt
export SBT_OPTS="-Xmx8G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss128M  -Duser.timezone=JST"

eval export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash

command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
