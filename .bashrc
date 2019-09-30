export PS1='\u \W$ '

source ~/.bash_aliases

#for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# git ps1
source $HOME/usr/local/etc/bash_completion.d/git-prompt.sh
source $HOME/usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\W\[\033[37m\]]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# sbt
export SBT_OPTS="-Xmx8G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss128M  -Duser.timezone=JST"

eval export PATH="$HOME/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash
source "$HOME/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.bash"
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
