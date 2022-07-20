#!/bin/bash

# Updates git global config file.
# ------------------------------------------------------------------------------

# Add default user name and email.
# git config --global user.name "Jeffrey Sadeli"
# git config --global user.email "jeffrey@sadeli.com"

# Assumes vscode is already installed.
if ! command -v code &> /dev/null; then
    echo "Visual Studio Code is not installed."
else
    git config --global core.editor "code --wait"
    git config --global core.autocrlf input
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code --wait $MERGED"
fi
