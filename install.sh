#!/usr/bin/env bash
set -e
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"
mv ~/.bashrc ~/.bashrc.old 2>/dev/null || true
ln -s $(readlink -f bashrc) ~/.bashrc
./install_git_aliases.sh
