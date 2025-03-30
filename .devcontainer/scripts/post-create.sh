#!/bin/bash

# ------------------------------------------------------------------------------
# zsh configuration
# ------------------------------------------------------------------------------

# powerline fonts for zsh theme
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd .. && rm -rf fonts

# oh-my-zsh plugins and themes
zsh -c 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k'
cp .devcontainer/dotfiles/.zshrc ~
cp .devcontainer/dotfiles/.p10k.zsh ~
