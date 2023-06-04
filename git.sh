#!/bin/bash

# ------------------------------------------------------------------------------
# Updates git global config file.
# ------------------------------------------------------------------------------

# Add default user name and email.
git config --global user.name "Jeffrey Sadeli"
git config --global user.email "jsadeli@users.noreply.github.com"

# TODO: Configure GPG keys for system.
# TODO: Configure GPG keys in vscode.
# TODO: Configure GPG keys in git.
# git config --global user.signingkey 1234567890123456
# git config --global commit.gpgSign true
# git config --global tag.gpgSign true

# ------------------------------------------------------------------------------

# set VSCode specific configurations
if ! command -v code &> /dev/null; then
    echo "'Visual Studio Code' is not installed."
    exit
else
    echo "'Visual Studio Code' found, configuring..."
    git config --global core.editor "code --wait"
    git config --global core.autocrlf input
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code --wait \$MERGED"
fi
