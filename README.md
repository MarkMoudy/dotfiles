# My Dotfiles
This is a repo of my dotfiles to set up a new osx machine.  Heavily influenced and structured based on [mathiasbynes/dotfiles](https://github.com/mathiasbynens/dotfiles).

## Usage
Clone this repo and navigate to dotfiles directory and execute `source bootstrap.sh`. Also install Brew before going much further.   

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

## Other Notes

To sync Sublime Text 3 Settings: 
```Bash
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Settings-sync/Sublime/User
```

Load Iterm2 settings folder from dropbox in the preferences pane.  