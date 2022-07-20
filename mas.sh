#!/bin/bash

# Install Mac-App store via the homebrew 'mas' formula.
# Assumes the homebrew 'mas' formula is already installed.
# ------------------------------------------------------------------------------

# Sign into the Mac App Store for the first time run.
# 'signin' command has been temporarily disabled on macOS 10.13+
# Issue #164 (https://github.com/mas-cli/mas/issues/164)
# mas signin jeffrey@sadeli.com

# Workaround to issue #164 (https://github.com/mas-cli/mas/issues/164)
if ! mas account >/dev/null; then
    echo "Please open App Store and sign in using your Apple ID ...."
    until mas account >/dev/null; do
        sleep 5
    done
fi

# Install Mac App Store apps
# mas install 904280696   # Things
# mas install 1333542190  # 1Password 7
# mas install 1319778037  # iStat Menus
# mas install 972028355   # Micro Snitch
# mas install 1528890965  # TextSniper
# mas install 931657367   # Calcbot
# mas install 975937182   # Fantastical
# mas install 1290358394  # Cardhop
# mas install 1055273043  # PDF Expert
# mas install 1502111349  # PDF Squeezer
# mas install 566631581   # PDF Protector
# mas install 937984704   # Amphetamine
# mas install 924726344   # Deliveries
# mas install 430255202   # Mactracker
# mas install 972572731   # Money Pro
# mas install 1491071483  # Tot
# mas install 1444383602  # GoodNotes
# mas install 1153157709  # Speedtest
# mas install 1529448980  # Reeder
mas install 497799835   # Xcode
# mas install 935235287   # Encrypto
# mas install 1224268771  # Screens
# mas install 1295203466  # Microsoft Remote Desktop
# mas install 1289583905  # Pixelmator Pro
# mas install 1147396723  # WhatsApp
# mas install 836500024   # WeChat
# mas install 747648890   # Telegram
# mas install 568494494   # Pocket
# mas install 1482454543  # Twitter
# mas install 897118787   # Shazam
# mas install 409201541   # Pages
# mas install 409203825   # Numbers
# mas install 409183694   # Keynote

# Upgrade any already-installed apps.
mas upgrade

echo "Success! Mac App Store applications are installed/upgraded."
