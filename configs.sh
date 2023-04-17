#!/bin/bash

# ------------------------------------------------------------------------------
# dot config files
# ------------------------------------------------------------------------------

# Removes file from $HOME (if it exists) and symlinks the file from the dotfiles
# .mpmrc
rm -rf "$HOME/.npmrc"
ln -s "$HOME/dotfiles/configs/.npmrc" "$HOME/.npmrc"
