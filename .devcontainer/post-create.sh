#!/bin/bash

OFF="\033[0m"           # text reset
YELLOW="\033[0;33m"

# ------------------------------------------------------------------------------
# zsh configuration
# ------------------------------------------------------------------------------

echo -e "${YELLOW}Install powerline fonts (for zsh theme)...${OFF}"
git clone --depth=1 https://github.com/powerline/fonts.git
cd fonts || exit
./install.sh
cd .. && rm -rf fonts

echo -e "${YELLOW}Install oh-my-zsh plugins and themes...${OFF}"
zsh -c 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k'

echo -e "${YELLOW}Copy powerlevel10k config...${OFF}"
curl "https://raw.githubusercontent.com/jsadeli/dotfiles/refs/heads/main/configs/.p10k.zsh" -o "$HOME/.p10k.zsh"

echo -e "${YELLOW}Copy zsh config...${OFF}"
curl "https://raw.githubusercontent.com/jsadeli/dotfiles/refs/heads/main/configs/.zshrc-lite" -o "$HOME/.zshrc"
