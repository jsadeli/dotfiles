#!/bin/sh -xe

# osxprep.sh will first install all updates.
# If a restart is required, simply run the script again.
# Once all updates are installed, osxprep.sh will then Install Xcode Command Line Tools.
# If you want to go the manual route, you can also install all updates by running "App Store",
# selecting the "Updates" icon, then updating both the OS and installed apps.
# ------------------------------------------------------------------------------

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ------------------------------------------------------------------------------

# Update the OS and Install Xcode Tools
echo "Updating OSX.  If this requires a restart, run the script again."

# Install all available updates
sudo softwareupdate -ia --verbose
# Install only recommended available updates
# sudo softwareupdate -ir --verbose

# ------------------------------------------------------------------------------

echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install
