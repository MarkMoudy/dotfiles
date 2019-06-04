#! /usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install Bash 4.
brew install bash
brew install bash-completion2
# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget`
brew install wget

# Install more recent versions of some OS X tools
brew install vim
brew install grep
brew install openssh
brew install screen
# brew install openssl
# brew link --force openssl

# Install other useful binaries
brew install ack
brew install git
brew install grc # Generic Log Colorizer
brew install httpie
brew install nmap
brew install netcat
brew install pigz
brew install pv # Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline. http://www.ivarch.com/programs/pv.shtml
brew install rename
brew install shellcheck
brew install ssh-copy-id
brew install tree
brew install zopfli

# Install Development languages and tools
# brew install go
# brew install nvm
# nvm install v0.12.0
# npm install -g bower
# brew install python --framework
# brew linkapps python
# brew install vault
# brew tap drone/drone
# brew install drone@0.8

# Remove outdated versions from the cellar
brew cleanup
