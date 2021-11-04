#!/bin/bash

# pyenv post-install setup script.
# reference: https://medium.com/geekculture/setting-up-python-environment-in-macos-using-pyenv-and-pipenv-116293da8e72
# ------------------------------------------------------------------------------

# Configure your zsh shell's environment for Pyenv.
echo "eval '$(pyenv init --path)'" >> ~/.zprofile

# add pyenv into zsh shell.
echo "if command -v pyenv &> /dev/null; then
  eval '$(pyenv init -)'
fi" >> ~/.zshrc
