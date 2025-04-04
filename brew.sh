#!/bin/bash

# ------------------------------------------------------------------------------
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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  #                     │││└─ follow location redirects (redo curl request if necessary)
  #                     ││└─ when used with -s it makes curl show an error message if it fails
  #                     │└─ silent or quiet mode
  #                     └─ fail silently on server errors
fi

# (Optionally) Turn off brew's analytics https://docs.brew.sh/Analytics
brew analytics off

# Enable autoupdate every 1 week (604800 seconds)
# To stop, use the command 'brew autoupdate stop'
brew autoupdate start 604800 --cleanup --enable-notification

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# ------------------------------------------------------------------------------

formulas=(
    # --- zsh customizations ---------------------------------------------------
    powerlevel10k                 # Theme for zsh
    zsh-history-substring-search  # Zsh port of Fish shell's history search
    zsh-autosuggestions           # Fish-like fast/unobtrusive autosuggestions for zsh
    zsh-syntax-highlighting       # Fish shell like syntax highlighting for zsh
    # --- shell utils ----------------------------------------------------------
    git             # Distributed revision control system.
    # coreutils       # GNU core utilities (those that come with OS X are outdated).
    # moreutils       # Collection of tools that nobody wrote when UNIX was young.
    # findutils       # Collection of GNU find, xargs, and locate.
    gnu-sed         # GNU/Linux implementation of stream editor.
    # htop            # Improved top (interactive process viewer).
    # glances         # Alternative to top/htop.
    # tree            # Display directories as trees.
    # peco            # Simplistic interactive filtering tool.
    # exa             # Modern replacement for 'ls'
    bat             # Clone of cat(1) with syntax highlighting and Git integration
    # --- dev tools ------------------------------------------------------------
    # pyenv           # Python version management.
    # pipenv          # Python dependency management tool.
    # ruby            # Powerful, clean, object-oriented scripting language
    node            # node.js | Platform built on V8 to build network applications.
    node-sass       # The reference implementation of Sass, written in Dart.
    # vite            # Next generation frontend tooling. It's fast!
    # angular-cli     # CLI tool for Angular.
    shellcheck      # Static analysis and lint tool, for (ba)sh scripts.
    cloc            # Statistics utility to count lines of code.
    # libpq           # Postgres C API library.
    # helm            # Kubernetes package manager.
    # httpie          # User-friendly cURL replacement (command-line HTTP client).
    # --- general --------------------------------------------------------------
    mas             # Mac App Store command-line interface.
    qpdf            # Tools for and transforming and inspecting PDF files.
    # pandoc          # Swiss-army knife of markup format conversion.
    # gnupg           # GNU Pretty Good Privacy (PGP) package.
)

# Install packages
for formula in "${formulas[@]}"; do
    brew install "$formula" || brew upgrade "$formula"
done

echo "Success! Homebrew formulas are installed."

# ------------------------------------------------------------------------------

casks=(
    firefox             # Web browser.
    google-chrome       # Web browser.
    # vivaldi             # Web browser focusing on customization and control.
    # opera               # Web browser.
    microsoft-edge      # [.pkg] Web browser.
    alfred              # Application launcher and productivity software.
    # raycast             # Control your tools with a few keystrokes.
    path-finder         # File manager.
    betterzip           # Utility to create and modify archives.
    default-folder-x    # Utility to enhance the Open and Save dialogs in applications.
    # hyperdock           # Add Window previews to dock apps.
    dockdoor            # Window peeking utility app.
    alt-tab             # Enable Windows-like alt-tab.
    soundsource         # Sound and audio controller.
    # moom                # Utility to move and zoom windows—on one display.
    shottr              # Screenshot measurement and annotation tool.
    little-snitch       # Host-based application firewall.
    cloudflare-warp     # Free app that makes your Internet safer.
    # hazel               # Automated organization.
    bartender           # Menu bar icon organizer.
    spotify             # Music streaming service.
    # julia               # Programming language for technical computing.
    docker              # App to build and share containerized applications and microservices.
    visual-studio-code  # Open-source code editor, diff, merge.
    jetbrains-toolbox   # JetBrains tools manager.
    # postman             # Collaboration platform for API development.
    imageoptim          # Tool to optimize images to a smaller size.
    # handbrake           # Open-source video transcoder.
    # authy               # Two-factor authentication software.
    iina                # Free and open-source media player.
    vlc                 # Multimedia player.
    # downie              # Downloads videos from different websites.
    # permute             # Converts and edits video, audio or image files.
    # microsoft-teams     # [.pkg] Meet, chat, call, and collaborate in just one place.
    # skype               # Video chat, voice call and instant messaging application.
    # zoom                # [.pkg] Video communication and virtual meeting platform.
    microsoft-office    # [.pkg] Microsoft Office suite.
    libreoffice         # Office suite.
    # soulver             # Notepad with a built-in calculator.
    # gpg-suite-no-mail   # Tools to protect your files.
    quicklook-json        # QuickLook plugin for JSON files.
    qlmarkdown            # QuickLook generator for Markdown files.
    chatgpt               # OpenAI's official ChatGPT desktop app.
    whatsapp              # Native desktop client for WhatsApp.
)

# Install cask packages
for cask in "${casks[@]}"; do
    brew install --cask --appdir="/Applications" "$cask" || brew upgrade --cask "$cask" || echo "'$cask' is already installed via other (non-homebrew)."
done

echo "Success! Homebrew casks are installed."

# ------------------------------------------------------------------------------

fonts_list=(
  font-jetbrains-mono-nerd-font
)

for font in "${fonts_list[@]}"
do
  brew install --cask "$font"
done

echo "Success! Homebrew cask fonts are installed."

# ------------------------------------------------------------------------------

# Remove outdated versions from the cellar.
brew cleanup
