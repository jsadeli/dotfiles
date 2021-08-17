#!/bin/sh -xe

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
if test ! $(which brew); then
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
    git
    # coreutils     # GNU core utilities (those that come with OS X are outdated)
    # moreutils     # Collection of tools that nobody wrote when UNIX was young
    # findutils     # Collection of GNU find, xargs, and locate
    # htop          # Improved top (interactive process viewer)
    glances         # Alternative to top/htop
    mas             # Mac App Store command-line interface
    python
    ruby
    node            # node.js | Platform built on V8 to build network applications
    qpdf            # Tools for and transforming and inspecting PDF files
    # pandoc
)

# Install packages
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

echo "Success! Homebrew formulas are installed."

# ------------------------------------------------------------------------------

casks=(
    firefox
    google-chrome
    vivaldi
    opera
    microsoft-edge      # .pkg installer, requests password.
    alfred
    betterzip
    default-folder-x
    hyperdock
    soundsource
    moom
    little-snitch
    cloudflare-warp
    hazel
    bartender
    spotify
    # julia
    docker
    visual-studio-code
    jetbrains-toolbox
    imageoptim
    sourcetree
    handbrake
    # authy
    iina
    vlc
    downie
    permute
    microsoft-teams     # .pkg installer, requests password.
    skype
    # zoom              # .pkg installer, requests password.
    microsoft-office    # .pkg installer, requests password.
    libreoffice
    soulver
)

# Install cask packages
for cask in "${casks[@]}"; do
    brew install --cask --appdir="/Applications" $cask || brew upgrade --cask $cask || echo "$cask is already installed via other (non-homebrew)."
done

echo "Success! Homebrew casks are installed."

# ------------------------------------------------------------------------------

# Remove outdated versions from the cellar.
brew cleanup
