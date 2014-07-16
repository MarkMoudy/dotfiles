# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/dupes/screen

# Install other useful binaries
install ack
	##BFG Repo-Cleaner - Removes large or troublesome blobs like git-filter-branch does, but faster. http://rtyley.github.io/bfg-repo-cleaner/ 
install bfg
install git
	##HashPump - A tool to exploit the hash length extension attack in various hashing algorithms. https://github.com/bwall/HashPump
install hashpump
install nmap
install node # This installs `npm` too using the recommended installation method
install pv ##Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline. http://www.ivarch.com/programs/pv.shtml
install rename
install tree
	## `tcpserver` et al. tcpserver and tcpclient are easy-to-use command-line tools for building TCP client-server applications. http://cr.yp.to/ucspi-tcp.html
install ucspi-tcp # `tcpserver` et al.
install webkit2png ##webkit2png is a command line tool that creates screenshots of webpages. http://www.paulhammond.org/webkit2png/

# Remove outdated versions from the cellar
cleanup
