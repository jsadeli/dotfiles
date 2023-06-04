#!/bin/bash

# ------------------------------------------------------------------------------
# dot config files
# ------------------------------------------------------------------------------

# Removes file from $HOME (if it exists) and symlinks the file from the dotfiles
# .mpmrc
rm -rf "$HOME/.npmrc"
ln -s "$HOME/dotfiles/configs/.npmrc" "$HOME/.npmrc"

# .gitconfig
rm -rf "$HOME/.gitconfig"
ln -s "$HOME/dotfiles/configs/.gitconfig" "$HOME/.gitconfig"

# .zshrc
rm -rf "$HOME/.zshrc"
ln -s "$HOME/dotfiles/configs/.zshrc" "$HOME/.zshrc"

# .p10k.zsh
rm -rf "$HOME/.p10k.zsh"
ln -s "$HOME/dotfiles/configs/.p10k.zsh" "$HOME/.p10k.zsh"
