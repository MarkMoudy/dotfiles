#! /usr/bin/env bash
# Install command-line tools using Homebrew.

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update
brew upgrade --all

brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/versions

brew install brew-cask

brew cask install java
brew cask install xquartz


# Sanity tools
brew cask install alfred 2> /dev/null
brew cask install bartender 2> /dev/null

#storage and cloudtools
brew cask install evernote 2> /dev/null
brew cask install google-drive 2> /dev/null

#System Tools
brew cask install appcleaner 2> /dev/null
brew cask install bettertouchtool 2> /dev/null
brew cask install day-o 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install liteicon 2> /dev/null
brew cask install little-snitch 2> /dev/null
brew cask install micro-snitch 2> /dev/null
brew cask install sizeup 2> /dev/null
brew cask install spectacle 2> /dev/null
brew cask install the-unarchiver 2> /dev/null

# Dev Tools
brew cask install androidtool 2> /dev/null
brew cask install imagealpha 2> /dev/null
brew cask install imageoptim 2> /dev/null
brew cask install numi 2> /dev/null
brew cask install sublime-text3 2> /dev/null
brew cask install vagrant 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vlc 2> /dev/null


# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion2

brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries
brew install ack
brew install cowsay
brew install git
brew install git-flow
brew install grc ## Generic Log Colorizer
brew install httpie
brew install nmap
brew install pigz
brew install rename
brew install tree
brew install zopfli

##Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline. http://www.ivarch.com/programs/pv.shtml
brew install pv 

# Install Language support
brew install python --framework
brew linkapps python
brew install nvm
brew install go

# Remove outdated versions from the cellar
brew cleanup
brew cask cleanup
