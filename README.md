# My Dotfiles
This is a repo of my dotfiles to set up a new osx machine.  Heavily influenced and structured based on [mathiasbynes/dotfiles](https://github.com/mathiasbynens/dotfiles).

## Usage
clone this repo and navigate to dotfiles directory and execute `source bootstrap.sh`.  

### Install Homebrew and Cask Formulas
Execute the Brewfile on a new machine to install a bunch of useful homebrew formulas. 
```Bash
bash ~/Brewfile
```  

After running the brew file you will need to update your shell to use the updated bash version instead of the system default bash. You will see complaints about `bash-completion` arguments if you have not done this.  
```Bash
$ sudo vi /etc/shells
// add `/usr/local/bin/bash` to the list of shells
$ chsh -s /usr/local/bin/bash
```
