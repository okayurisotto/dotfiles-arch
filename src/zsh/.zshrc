# system {{{

typeset -U PATH

autoload -U compinit && compinit
zstyle ':completion:*' menu select

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history

bindkey -e

eval "$(starship init zsh)" &> /dev/null

# }}}

# alias {{{

alias clip='xclip -selection clipboard'
alias fzf="fzf --color='prompt:cyan,pointer:cyan,marker:cyan,gutter:-1'"
alias g='git'
alias grep='rg'
alias icat='mpv --pause=yes'
alias ls='exa'
alias sq='squoosh-cli --mozjpeg {"quality":75}'
alias tree='exa --tree'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# }}}

# SSH {{{
# https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows

env="$HOME/.ssh/agent.env"

[[ -f "$env" ]] && . "$env" &> /dev/null

agent_run_state="$(ssh-add -l &> /dev/null; echo $?)"
# 0: agent running with key
# 1: agent running without key
# 2: agent not running

if [[ ! "$SSH_AUTH_SOCK" ]] || [[ "$agent_run_state" = '2' ]]; then
  umask 077
  ssh-agent > "$env" 2> /dev/null
  . "$env" > /dev/null

  ssh-add
elif [[ "$SSH_AUTH_SOCK" ]] && [[ "$agent_run_state" = '1' ]]; then
  ssh-add
fi

unset agent_run_state
unset env

# }}}

# tmux {{{
# https://qiita.com/ssh0/items/a9956a74bff8254a606a

if [[ -n "$DISPLAY" ]]; then
  if [[ -z "$TMUX" ]]; then
    sessions="$(tmux list-sessions 2> /dev/null)"

    create_new_session='Create new session'

    if [[ -z $sessions ]]; then
      message="$create_new_session"
    else
      message="$sessions\n$create_new_session"
    fi

    id="$(echo "$message" | fzf --layout=reverse --select-1 | sed 's/:.*//')"

    if [[ "$id" = "$create_new_session" ]]; then
      tmux new-session && exit
    elif [[ -n "$id" ]]; then
      tmux attach-session -t "$id" && exit
    else
      : # Start terminal normally
    fi
  fi
fi

# }}}
