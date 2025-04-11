#!/bin/bash

OFF="\033[0m"           # text reset
YELLOW="\033[0;33m"

# ------------------------------------------------------------------------------
# zsh configurations
# ------------------------------------------------------------------------------

echo -e "${YELLOW}-> Install 'Meslo LGM NerdFont Mono Regular'...${OFF}"
mkdir -p ~/.local/share/fonts
(cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/Meslo/M/Regular/MesloLGMNerdFontMono-Regular.ttf)

echo -e "${YELLOW}-> Install 'Oh My Posh' and custom theme...${OFF}"
curl -s https://ohmyposh.dev/install.sh | bash -s
mkdir -p "$HOME/.oh-my-posh"
curl "https://raw.githubusercontent.com/jsadeli/dotfiles/refs/heads/main/configs/p10k_lean.omp.json" -o "$HOME/.oh-my-posh/p10k_lean.omp.json"

echo -e "${YELLOW}-> Copy customized zsh config...${OFF}"
cp .devcontainer/configs/.zshrc "$HOME/.zshrc"

echo -e "${YELLOW}-> Done!${OFF}"
