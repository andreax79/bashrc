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
source ~/.config/bash/default.sh
if [ -f ~/.config/bash/config.sh ]; then
    source ~/.config/bash/config.sh
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
bind 'TAB:menu-complete'
bind 'set bell-style none'

# Alias definitions -----------------------------------------------------------
source ~/.config/bash/aliases.sh

# FZF -------------------------------------------------------------------------
if [ "$HAS_FZF" -eq "1" ]; then
    export FZF_DEFAULT_OPTS='--bind=shift-tab:up,tab:down --cycle'  # use tab to move cursor to next entry, cycle
    export FZF_DEFAULT_COMMAND='ag -l'
    source ~/.config/bash/fzf.sh
fi

# Node Version Manager  -------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Prompt ----------------------------------------------------------------------
source ~/.config/bash/prompt.sh

# zoxide/z --------------------------------------------------------------------
if [ "$HAS_ZOXIDE" -eq "1" ]; then
    eval "$(zoxide init bash)"
else
    source ~/.config/bash/z.sh
fi

# Local config ----------------------------------------------------------------
if [ -f ~/.config/bash/local.sh ]; then
    source ~/.config/bash/local.sh
fi
