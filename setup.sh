#!/bin/sh -xe

# Main setup script.
# ------------------------------------------------------------------------------

# Install all OS updates and Xcode Command Line Tools.
./macosprep.sh

# Install homebrew and default formulae/casks.
./brew.sh

# Install default MAS apps.
./mas.sh

# Update global git config file.
./git.sh

# TODO: Configure GPG keys for system.
# TODO: Configure GPG keys in vscode.
# TODO: Configure GPG keys in git.
# git config --global user.signingkey 1234567890123456
# git config --global commit.gpgsign true
