#!/bin/bash

# ------------------------------------------------------------------------------
# Install Developer Fonts
# ------------------------------------------------------------------------------

# install JetBrains Mono Nerd Font
case $(uname | tr '[:upper:]' '[:lower:]') in
  darwin*)
    echo "installing 'JetBrains Mono Nerd Font' for macOS..."
    cd ~/Library/Fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf
    #                           ││└─ write output to a local file named like the remote file we get
    #                           │└─ follow location redirects (redo curl request if necessary)
    #                           └─ fail silently on server errors
    ;;
  linux*)
    echo "installing 'JetBrains Mono Nerd Font' for linux OS..."
    mkdir -p ~/.local/share/fonts
    #      └─  no error if existing, make parent directories as needed
    cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf
    #                                ││└─ write output to a local file named like the remote file we get
    #                                │└─ follow location redirects (redo curl request if necessary)
    #                                └─ fail silently on server errors
    ;;
esac
