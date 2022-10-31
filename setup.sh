#!/bin/bash

# ------------------------------------------------------------------------------
# Main setup script.
# ------------------------------------------------------------------------------

# Install all MacOS updates and Xcode Command Line Tools.
./macosprep.sh

# Update MacOS preferences.
./macos.sh

# Install Homebrew and default formulae/casks.
./brew.sh

# Install default MAS apps.
./mas.sh

# Update global Git config file.
./git.sh

# TODO: Configure GPG keys for system.
# TODO: Configure GPG keys in vscode.
# TODO: Configure GPG keys in git.
# git config --global user.signingkey 1234567890123456
# git config --global commit.gpgSign true
# git config --global tag.gpgSign true
