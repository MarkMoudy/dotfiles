#!/usr/bin/env bash

# Cask apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"

# Sanity tools
brew install --cask alfred
brew install --cask bartender

# System Tools
brew install --cask appcleaner 2> /dev/null
brew install --cask bettertouchtool 2> /dev/null
brew install --cask brave-browser 2> /dev/null
brew install --cask istat-menus 2> /dev/null
brew install --cask iterm2 2> /dev/null
brew install --cask keepassxc 2> /dev/null
brew install --cask shuttle 2> /dev/null
brew install --cask the-unarchiver 2> /dev/null

# Dev Tools
brew install --cask imageoptim 2> /dev/null
brew install --cask numi 2> /dev/null
brew install --cask visual-studio-code 2> /dev/null
brew install --cask vlc 2> /dev/null

# Fonts
brew tap homebrew/cask-fonts
# svn is needed for source-code-pro font installation
brew install svn
brew install font-source-code-pro font-roboto font-roboto-mono
brew uninstall svn

brew cleanup
