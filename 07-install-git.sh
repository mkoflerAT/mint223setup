#!/bin/bash
# Git configuration
# Usage: ./08-install-git.sh [ldaine|mkoflerat]
# Or set USERNAME variable: USERNAME=ldaine ./08-install-git.sh

# Configuration - can be overridden via argument or USERNAME env var
USERNAME="${1:-$USERNAME}"

# User configurations
declare -A GIT_NAME=([ldaine]="Liga Daine" [mkoflerat]="Markus Kofler")
declare -A GIT_EMAIL=([ldaine]="liga.daine@daine-it.com" [mkoflerat]="git@markuskofler.com")

# Validate user
if [[ -z "$USERNAME" ]] || [[ ! -v GIT_NAME[$USERNAME] ]]; then
    echo "Usage: $0 [ldaine|mkoflerat]"
    exit 1
fi

GIT_USER="${GIT_NAME[$USERNAME]}"
GIT_EMAIL="${GIT_EMAIL[$USERNAME]}"

echo "Installing and configuring git for: $USERNAME"
sudo apt install git -y

echo "Configuring git global settings..."
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
git config --global core.autocrlf input
git config --global core.editor "code --wait --new-window"
git config --global init.defaultbranch main

echo "Git configured for $GIT_USER ($GIT_EMAIL)"
