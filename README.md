### My Dotfiles
This is a repo of my dotfiles to set up a new osx machine.  Heavily influenced and structured based on [mathiasbynes/dotfiles](https://github.com/mathiasbynens/dotfiles).

#### Usage
navigate to dotfiles directory and execute `source bootstrap.sh`

#### Install Homebrew Formulas
Execute the Brewfile on a new machine to install a bunch of useful homebrew formulas. 
```Bash
brew bundle ~/Brewfile
```

#### Install Native Apps with `Brew Cask`
The Caskfile contains some native apps that can be installed with `brew cask:`
```Bash
brew bundle ~/Caskfile
```

TODO:  find a new system as this one isn't working well and need to add node packages through npm to the system. check out: 
*https://github.com/necolas/dotfiles
*https://github.com/alrra/dotfiles
