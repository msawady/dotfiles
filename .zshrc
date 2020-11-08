
source ~/.zsh_aliases
setopt IGNOREEOF

#for completion
fpath=(/usr/local/share/zsh-completions $fpath)
if [ -f $(brew --prefix)/etc/zsh_completion ]; then
  source $(brew --prefix)/etc/zsh_completion
fi

# 補完機能有効にする
autoload -U compinit
compinit -u
 
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
 
# enable del key
bindkey "^[[3~" delete-char

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
 
# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# git ps1
#source /usr/local/etc/zsh_completion.d/git-prompt.sh
#source /usr/local/etc/zsh_completion.d/git-completion.zsh
GIT_PS1_SHOWDIRTYSTATE=true


# sbt
export SBT_OPTS="-Xmx8G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss128M  -Duser.timezone=JST"

# golang
export GOPATH="$HOME/go/"

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

# zsh prompt
source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX=" ]"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
RPROMPT='$(git_super_status)'

# use vi mode
bindkey -v

# show vim mode(INS/NOR) in prompt
function zle-keymap-select zle-line-init
{
    case $KEYMAP in
        main|viins)
            VI_MODE="%{$fg[cyan]%}INS%{$reset_color%}"
            ;;
        vicmd)
            VI_MODE="%{$fg[magenta]%}NOR%{$reset_color%}"
            ;;
    esac

    PROMPT="[%1d : $VI_MODE] %%  "
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# emacs like insert mode
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^B'  backward-char
bindkey -M viins '^D'  delete-char-or-list
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^F'  forward-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^K'  kill-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^R'  history-incremental-pattern-search-backward
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
