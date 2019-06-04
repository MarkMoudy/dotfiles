#! /usr/bin/env bash

# Cask apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/versions

brew install brew-cask

# Sanity tools
brew cask install alfred 2> /dev/null
brew cask install bartender 2> /dev/null

# System Tools
brew cask install appcleaner 2> /dev/null
brew cask install bettertouchtool 2> /dev/null
brew cask install istat-menus 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install keepassxc 2> /dev/null
brew cask install shuttle 2> /dev/null
brew cask install sizeup 2> /dev/null
brew cask install spectacle 2> /dev/null
brew cask install the-unarchiver 2> /dev/null

# Dev Tools
brew cask install imagealpha 2> /dev/null
brew cask install imageoptim 2> /dev/null
brew cask install numi 2> /dev/null
brew cask install visual-studio-code 2> /dev/null
brew cask install toggldesktop 2> /dev/null
brew cask install vlc 2> /dev/null

brew cask cleanup