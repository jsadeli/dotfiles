#!/bin/sh -xe

# Main setup script.
# ------------------------------------------------------------------------------

# Install all OS updates and Xcode Command Line Tools.
./macosprep.sh

# Install homebrew and default formulae/casks.
./brew.sh

# Install default MAS apps.
./mas.sh
