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
  # --- zsh customizations -----------------------------------------------------
  zsh-history-substring-search  # Zsh port of Fish shell's history search.
  zsh-autosuggestions           # Fish-like fast/unobtrusive autosuggestions for zsh.
  zsh-syntax-highlighting       # Fish shell like syntax highlighting for zsh.
  oh-my-posh                    # A prompt theme engine for any shell.
  # --- shell utils ------------------------------------------------------------
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
  bat             # Clone of cat(1) with syntax highlighting and Git integration.
  # --- dev tools --------------------------------------------------------------
  # pyenv           # Python version management.
  # pipenv          # Python dependency management tool.
  # ruby            # Powerful, clean, object-oriented scripting language.
  node            # node.js | Platform built on V8 to build network applications.
  # node-sass       # The reference implementation of Sass, written in Dart.
  # vite            # Next generation frontend tooling. It's fast!
  # angular-cli     # CLI tool for Angular.
  shellcheck      # Static analysis and lint tool, for (ba)sh scripts.
  cloc            # Statistics utility to count lines of code.
  # libpq           # Postgres C API library.
  # helm            # Kubernetes package manager.
  httpie          # User-friendly cURL replacement (command-line HTTP client).
  # --- programming languages --------------------------------------------------
  openjdk         # Development kit for the Java programming language.
  kotlin          # Statically typed programming language for the JVM.
  # julia           # Fast, Dynamic Programming Language.
  # --- general ----------------------------------------------------------------
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
  # --- web browsers -----------------------------------------------------------
  firefox             # Web browser.
  google-chrome       # Web browser.
  # vivaldi             # Web browser with built-in email client focusing on customization and control.
  microsoft-edge      # Multi-platform web browser.
  # --- launchers --------------------------------------------------------------
  alfred              # Application launcher and productivity software.
  # raycast             # Control your tools with a few keystrokes.
  # --- desktop ----------------------------------------------------------------
  alt-tab             # Enable Windows-like alt-tab.
  # --- finder  ----------------------------------------------------------------
  path-finder         # File manager.
  default-folder-x    # Utility to enhance the Open and Save dialogs in applications.
  # --- quicklook plugins ------------------------------------------------------
  quicklook-json        # QuickLook plugin for JSON files.
  qlmarkdown            # QuickLook generator for Markdown files.
  # --- dock  ------------------------------------------------------------------
  dockdoor            # Window peeking utility app.
  # --- menu bar  --------------------------------------------------------------
  bartender           # Menu bar icon organizer.
  # hiddenbar           # Utility to hide menu bar items.
  stats                 # System monitor for the menu bar.
  # itsycal             # Menu bar calendar.
  # --- network ----------------------------------------------------------------
  little-snitch       # Host-based application firewall.
  cloudflare-warp     # Free app that makes your Internet safer.
  # --- archives  --------------------------------------------------------------
  betterzip           # Utility to create and modify archives.
  # --- automation  ------------------------------------------------------------
  # hazel               # Automated organization.
  # --- design -----------------------------------------------------------------
  shottr              # Screenshot measurement and annotation tool.
  # --- development ------------------------------------------------------------
  docker              # App to build and share containerized applications and microservices.
  visual-studio-code  # Open-source code editor, diff, merge.
  jetbrains-toolbox   # JetBrains tools manager.
  # postman             # Collaboration platform for API development.
  # warp                # Rust-based terminal
  # --- media   ----------------------------------------------------------------
  soundsource         # Sound and audio controller.
  iina                # Free and open-source media player.
  vlc                 # Multimedia player.
  spotify             # Music streaming service.
  imageoptim          # Tool to optimize images to a smaller size.
  downie              # Downloads videos from different websites.
  permute             # Converts and edits video, audio or image files.
  # handbrake           # Open-source video transcoder.
  # --- productivity -----------------------------------------------------------
  microsoft-office    # Microsoft Office suite.
  libreoffice         # Office suite.
  # soulver             # Notepad with a built-in calculator.
  # --- encryption -------------------------------------------------------------
  gpg-suite-no-mail   # Tools to protect your files.
  # --- communication ----------------------------------------------------------
  whatsapp              # Native desktop client for WhatsApp.
  # microsoft-teams     # Meet, chat, call, and collaborate in just one place.
  # zoom                # Video communication and virtual meeting platform.
  # --- generative ai ----------------------------------------------------------
  chatgpt               # OpenAI's official ChatGPT desktop app.
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
