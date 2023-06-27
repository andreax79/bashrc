#!/usr/bin/env bash
set -e
git config --replace-all --global alias.br      '--format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]" --sort=-committerdate'
git config --replace-all --global alias.co      'checkout'
git config --replace-all --global alias.dc      'diff --cached'
git config --replace-all --global alias.df      'diff'
git config --replace-all --global alias.last    'log -1 HEAD --stat'
git config --replace-all --global alias.lg      'log -p'
git config --replace-all --global alias.ll      'log --oneline'
git config --replace-all --global alias.s       'status -sb'
git config --replace-all --global alias.st      'status -sb'
git config --replace-all --global alias.undo    'reset HEAD~1 --mixed'
