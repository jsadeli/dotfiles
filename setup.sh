#!/bin/sh -xe

# Main setup script.
# ------------------------------------------------------------------------------

# Install all OS updates and Xcode Command Line Tools.
./osxprep.sh

# Install homebrew and default formulae/casks.
./brew.sh

# Install default MAS apps.
./mas.sh
