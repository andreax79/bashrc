alias ls='ls --color=auto -F'
alias ll='ls --color=auto -lh'
alias lt='ls --human-readable --size -1 -S --classify'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias df.='df -h .'
alias free='free -mht'

alias vi=nvim
alias vim=nvim

alias k=kubectl
complete -o default -F __start_kubectl k
