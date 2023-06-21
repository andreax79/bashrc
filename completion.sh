# Enable bash programmable completion features in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
    for bcfile in ~/.config/bash/bash_completion.d/* ; do
      source $bcfile
    done
fi
