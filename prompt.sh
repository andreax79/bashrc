PROMPT_COMMAND='RET=$?'

if [ "$HAS_KUBE" -eq "1" ]; then
    KUBE_PS1_SUFFIX=') ' # Prompt closing character
    source ~/.config/bash/kube-ps1.sh
else
    kube_ps1() { echo; }
fi
if [ "$HAS_GIT" -eq "1" ]; then
    GIT_PS1_SHOWUNTRACKEDFILES=1  # Show (%) if there're untracked files
    GIT_PS1_SHOWDIRTYSTATE=1  # Show unstaged (*) and staged (+) changes
    GIT_PS1_SHOWCOLORHINTS=1  # Color the hint about the current dirty state
    source ~/.config/bash/git-prompt.sh
else
    __git_ps1() { echo; }
fi

function exit_status_ps1 {
    if [ $RET -ne 0 ]; then
        echo -en "(\033[00;31mexit=$RET\033[00m) "
    fi
}

export PS1=\
'$(__git_ps1 "(%s) ")'\
'$(kube_ps1)'\
'${debian_chroot:+($debian_chroot)}'\
'$([ \j -gt 0 ] && echo "(\[\033[00;31m\]jobs=\j\[\033[00m\]) ")$(exit_status_ps1)'\
'\[\033[00m\]\u@\h\[\033[00m\] \t\n'\
'\[\033[01;34m\]\w\[\033[00m\]\$ '
