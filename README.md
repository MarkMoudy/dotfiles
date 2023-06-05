# My Dotfiles
This is a repo of my dotfiles to set up a new osx machine.  Heavily influenced and structured based on [mathiasbynes/dotfiles](https://github.com/mathiasbynens/dotfiles).

## Usage

Clone this repo and navigate to dotfiles directory and execute `source bootstrap.sh`. Also install Brew before going much further.

### Install Homebrew and Cask Formulas

Execute the Brewfile on a new machine to install a bunch of useful homebrew formulas.

```Bash
bash ./brew.sh
```

After running the brew file you will need to update your shell to use the updated bash version instead of the system default bash. You will see complaints about `bash-completion` arguments if you have not done this.

```Bash
$ sudo vi /etc/shells
# add `/usr/local/bin/bash` to the list of shells
$ chsh -s /usr/local/bin/bash
```

### Setting up SSH

First create keepass db. Then create ssh keys, ensure [Keepass SSH Agent integration](https://keepassxc.org/docs/KeePassXC_UserGuide#_setting_up_ssh_agent_integration) and [configure an entry to use SSH Agent](https://keepassxc.org/docs/KeePassXC_UserGuide#_configuring_an_entry_to_use_ssh_agent)

Create SSH config:

- `touch ~/.ssh/config`

Then for each key you want to use specifically for a domain add the following:

```ssh
Host {host-alias}
    Hostname {host-domain}
    IdentitiesOnly yes
    IdentityFile ~/.ssh/{public-key}.pub
```

## Other tasks

- screenshots setup
- chrome install ublock-origin, octotree, tab suspender?
- update Mac Settings
  - Finder hidden files
  - trackpad, mouse and keyboard key repeat speeds
