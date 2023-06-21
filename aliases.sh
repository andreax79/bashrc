alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vi=nvim
alias vim=nvim

alias helm='microk8s helm'
alias k=kubectl
complete -o default -F __start_kubectl k
