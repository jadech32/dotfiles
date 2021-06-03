#!/bin/bash

# ---
# Symlinks
# ---

first=1

relink() {
    # If it's already a symlink, do nothing.
    if [ "$(readlink "$HOME/$1")" = "$2" ]; then
        echo "$1 is already a symlink."
        return
    fi
    if [[ $first = 1 ]]; then
        echo "set -e"
        first=0
    fi
    # Check if the file in $HOME already exists
    # If so remove it and back it up (TODO)
    if [[ -e "$HOME/$1" || -L "$HOME/$1" ]]; then
        echo "rm -f $HOME/$1"
    fi
    echo "ln -s -v $2 $HOME/$1"
}

DOTFILES=$(pwd)
# Git
relink .gitconfig "$DOTFILES/git/gitconfig"

# zsh
relink .zshrc "$DOTFILES/zsh/zshrc"
relink .zlogout "$DOTFILES/zsh/zlogout"
