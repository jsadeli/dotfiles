#!/bin/bash

# ------------------------------------------------------------------------------
# Configure the default MacOS preferences.
# More info: https://macos-defaults.com/
# ------------------------------------------------------------------------------

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ------------------------------------------------------------------------------
# General
# ------------------------------------------------------------------------------

# Choose default file save location to disk. Default is true (iCloud).
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool false

# Always show scrollbars.
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain "AppleShowScrollBars" -string "Always"

# Show all file extensions in the Finder. Default is false.
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# ------------------------------------------------------------------------------
# Dock
# ------------------------------------------------------------------------------

# Put the Dock on the left of the screen. Default is "bottom".
defaults write com.apple.dock "orientation" -string "left"

# Set the icon size of Dock items to 36 pixels. Default is 48 pixels.
defaults write com.apple.dock "tilesize" -int 36

# Disable resizing of the macOS dock. Default is false.
defaults write com.apple.dock "size-immutable" -bool true

# Change the Dock minimize animation to scale. Default is "genie".
defaults write com.apple.dock "mineffect" -string "scale"

# Make Dock icons of hidden applications translucent. Default is false.
defaults write com.apple.dock "showhidden" -bool true

# Don’t show recent applications in Dock. Default is true.
defaults write com.apple.dock "show-recents" -bool false

# Minimize windows into their application’s icon. Default is false.
defaults write com.apple.dock "minimize-to-application" -bool true

# Don’t automatically rearrange Spaces based on most recent use. Default is true.
defaults write com.apple.dock "mru-spaces" -bool false

# ------------------------------------------------------------------------------
# Finder
# ------------------------------------------------------------------------------

# Keep folders on top. Default is false.
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Keep folders on top when sorting. Default is false.
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool true

# Automatically empty bin after 30 days. Default is false.
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true

# ------------------------------------------------------------------------------
# Printers
# ------------------------------------------------------------------------------

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# ------------------------------------------------------------------------------
# Kill
# ------------------------------------------------------------------------------

# kill affected apps to apply changes
killall Dock
killall Finder
