#!/bin/bash
set -e
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

BASHRC=$(readlink -f ../bashrc)
if [ -L ~/.bashrc ]; then  # ~/.bashrc is a link
    rm ~/.bashrc
    echo "source $BASHRC" > ~/.bashrc
elif [ -e ${my_link} ] ; then  # ~/.bashrc is not a link
    if ! grep -q $BASHRC ~/.bashrc; then
        echo "source $BASHRC" >> ~/.bashrc
    fi
else  # ~/.bashrc does not exist
    echo "source $BASHRC" > ~/.bashrc
fi
