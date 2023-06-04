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

# Update (replace) config files.
./configs.sh
./gitconfig.sh
