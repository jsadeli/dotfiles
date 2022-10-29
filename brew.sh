#!/bin/bash

# Install command-line tools using Homebrew.
# ------------------------------------------------------------------------------

# Ask for the administrator password upfront.
# sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ------------------------------------------------------------------------------

# Check for Homebrew and install if we don't have it.
# This script installs Homebrew to its preferred prefix:
#   /usr/local                      for macOS Intel
#   /opt/homebrew                   for Apple Silicon
#   /home/linuxbrew/.linuxbrew      for Linux
# so that you don’t need sudo when you brew install.
if ! command -v brew &> /dev/null; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# (Optionally) Turn off brew's analytics https://docs.brew.sh/Analytics
brew analytics off

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# ------------------------------------------------------------------------------

formulas=(
    git             # Distributed revision control system.
    # coreutils       # GNU core utilities (those that come with OS X are outdated).
    # moreutils       # Collection of tools that nobody wrote when UNIX was young.
    # findutils       # Collection of GNU find, xargs, and locate.
    gnu-sed         # GNU/Linux implementation of stream editor.
    # htop            # Improved top (interactive process viewer).
    # glances         # Alternative to top/htop.
    # tree            # Display directories as trees.
    # peco            # Simplistic interactive filtering tool.
    mas             # Mac App Store command-line interface.
    # qpdf            # Tools for and transforming and inspecting PDF files.
    # pandoc          # Swiss-army knife of markup format conversion.
    # gnupg           # GNU Pretty Good Privacy (PGP) package.
    # pyenv           # Python version management.
    # pipenv          # Python dependency management tool.
    # ruby            # Distributed revision control system.
    node            # node.js | Platform built on V8 to build network applications.
    node-sass       # The reference implementation of Sass, written in Dart.
    # vue-client      # Standard tooling for Vue.js development.
    # angular-cli     # CLI tool for Angular.
    shellcheck      # Static analysis and lint tool, for (ba)sh scripts.
    # cloc            # Statistics utility to count lines of code.
)

# Install packages
for formula in "${formulas[@]}"; do
    brew install "$formula" || brew upgrade "$formula"
done

echo "Success! Homebrew formulas are installed."

# ------------------------------------------------------------------------------

casks=(
    # firefox             # Web browser.
    google-chrome       # Web browser.
    # vivaldi             # Web browser focusing on customization and control.
    # opera               # Web browser.
    # microsoft-edge      # [.pkg] Web browser.
    # alfred              # Application launcher and productivity software.
    # path-finder         # File manager.
    # betterzip           # Utility to create and modify archives.
    # default-folder-x    # Utility to enhance the Open and Save dialogs in applications.
    # hyperdock           # Add Window previews to dock apps.
    # alt-tab             # Enable Windows-like alt-tab.
    # soundsource         # Sound and audio controller.
    # moom                # Utility to move and zoom windows—on one display.
    # shottr              # Screenshot measurement and annotation tool.
    # little-snitch       # Host-based application firewall.
    # cloudflare-warp     # Free app that makes your Internet safer.
    # hazel               # Automated organization.
    # bartender           # Menu bar icon organizer.
    # spotify             # Music streaming service.
    # julia               # Programming language for technical computing.
    docker              # App to build and share containerized applications and microservices.
    visual-studio-code  # Open-source code editor, diff, merge.
    # jetbrains-toolbox   # JetBrains tools manager.
    # imageoptim          # Tool to optimize images to a smaller size.
    # handbrake           # Open-source video transcoder.
    # authy               # Two-factor authentication software.
    # iina                # Free and open-source media player.
    # vlc                 # Multimedia player.
    # downie              # Downloads videos from different websites.
    # permute             # Converts and edits video, audio or image files.
    # microsoft-teams     # [.pkg] Meet, chat, call, and collaborate in just one place.
    # skype               # Video chat, voice call and instant messaging application.
    # zoom                # [.pkg] Video communication and virtual meeting platform.
    # microsoft-office    # [.pkg] Microsoft Office suite.
    # libreoffice         # Office suite.
    # soulver             # Notepad with a built-in calculator.
    gpg-suite-no-mail   # Tools to protect your files.
)

# Install cask packages
for cask in "${casks[@]}"; do
    brew install --cask --appdir="/Applications" "$cask" || brew upgrade --cask "$cask" || echo "'$cask' is already installed via other (non-homebrew)."
done

echo "Success! Homebrew casks are installed."

# ------------------------------------------------------------------------------

# Remove outdated versions from the cellar.
brew cleanup

# Enable autoupdate every 1 week (604800 seconds)
# To stop, use the command 'brew autoupdate stop'
brew autoupdate start 604800 --cleanup --enable-notification
