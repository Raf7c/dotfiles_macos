#!/usr/bin/env zsh


echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install bat

brew install --no-quarantine --cask visual-studio-code
brew install --no-quarantine --cask raycast
brew install --no-quarantine --cask kitty