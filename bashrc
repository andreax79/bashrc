# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# Add date and time formatting to bash history.
HISTTIMEFORMAT="%F %T "

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# The pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Configure Ctrl-w to delete word
stty werase undef
bind '\C-w:unix-filename-rubout'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Config ----------------------------------------------------------------------
HAS_KUBE=1
if [ -f ~/.config/bash/config.sh ]; then
    source ~/.config/bash/config.sh
else:
    kube_ps1() { echo; }
fi

# Environment -----------------------------------------------------------------
export PYTHONSTARTUP=~/.pythonrc
export PATH=~/.local/bin:~/go/bin:/snap/bin:$PATH
export EDITOR="nvim"
export VISUAL="nvim"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  # colored GCC warnings and errors
export AWS_PROFILE="default"
export AWS_REGION="eu-west-1"

# Bash completition -----------------------------------------------------------
source ~/.config/bash/completion.sh

# Alias definitions -----------------------------------------------------------
source ~/.config/bash/aliases.sh

# FZF -------------------------------------------------------------------------
source ~/.config/bash/fzf.sh
source ~/.config/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
export FZF_DEFAULT_OPTS='--bind=shift-tab:up,tab:down --cycle'  # use tab to move cursor to next entry, cycle
export FZF_DEFAULT_COMMAND='ag -l'

# z ---------------------------------------------------------------------------
source ~/.config/bash/z.sh

# Prompt ----------------------------------------------------------------------
GIT_PS1_SHOWUNTRACKEDFILES=1  # Show (%) if there're untracked files
GIT_PS1_SHOWDIRTYSTATE=1  # Show unstaged (*) and staged (+) changes
GIT_PS1_SHOWCOLORHINTS=1  # Color the hint about the current dirty state
KUBE_PS1_SUFFIX=') ' # Prompt closing character
if [ "$HAS_KUBE" -eq "1" ]; then
    source ~/.config/bash/kube-ps1.sh
fi
source ~/.config/bash/git-prompt.sh

export PS1=\
'$(__git_ps1 "(%s)") '\
'$(kube_ps1)'\
'${debian_chroot:+($debian_chroot)}'\
'$([ \j -gt 0 ] && echo "(\[\033[00;31m\]jobs=\j\[\033[00m\]) ")'\
'\[\033[00m\]\u@\h\[\033[00m\] \t\n'\
'\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ -f ~/.config/bash/local.sh ]; then
    source ~/.config/bash/local.sh
fi
