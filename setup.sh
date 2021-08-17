#!/bin/sh -xe

# Main setup script.
# ------------------------------------------------------------------------------

# Install homebrew and default formulae/casks.
./brew.sh

# Install default MAS apps.
./mas.sh
