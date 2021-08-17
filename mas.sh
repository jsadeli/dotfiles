#!/bin/sh -xe

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
mas install 904280696   # Things (3.14.1)
mas install 1333542190  # 1Password 7 (7.8.7)
mas install 1319778037  # iStat Menus (6.51)
mas install 972028355   # Micro Snitch (1.4.1)
mas install 1528890965  # TextSniper (1.7.0)
mas install 931657367   # Calcbot (2.7.15)
mas install 975937182   # Fantastical (3.4.3)
mas install 1290358394  # Cardhop (2.0.5)
mas install 1055273043  # PDF Expert (2.5.18)
mas install 1502111349  # PDF Squeezer (4.2.2)
mas install 566631581   # PDF Protector (1.5)
mas install 937984704   # Amphetamine (5.2.2)
mas install 924726344   # Deliveries (3.2.4)
mas install 430255202   # Mactracker (7.10.7)
mas install 972572731   # Money Pro (2.7.15)
mas install 1491071483  # Tot (1.2.2)
mas install 1444383602  # GoodNotes (5.7.18)
mas install 1153157709  # Speedtest (1.20)
mas install 1529448980  # Reeder (5.0.7)
mas install 497799835   # Xcode (12.5.1)
mas install 935235287   # Encrypto (1.3.7)
mas install 1224268771  # Screens (4.8.8)
mas install 1295203466  # Microsoft Remote Desktop (10.6.7)
mas install 1289583905  # Pixelmator Pro (2.1.2)
mas install 1147396723  # WhatsApp (2.2126.15)
mas install 568494494   # Pocket (1.8.6)
mas install 1482454543  # Twitter (8.76)
mas install 897118787   # Shazam (2.10.0)
mas install 409201541   # Pages (11.1)
mas install 409203825   # Numbers (11.1)
mas install 409183694   # Keynote (11.1)

# Upgrade any already-installed apps.
mas upgrade
