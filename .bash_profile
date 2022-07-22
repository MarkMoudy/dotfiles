#!/usr/bin/env bash

# ignore Apple default shell is now zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS='--appdir=/Applications'

# Default Prompt settings
# \h - hostname up to the first '.'
# \W - THe base name of the current working directory with $HOME abbreviated with a tilde
# \u - The username of the current user
export PS1="\[\033[0;33m\]\u\[\033[0m\]\[\033[0;34m\]@\h\[\033[0m\]:\[\033[0;32m\]\W \$ \[\033[0m\]"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#setup nodejs NVM tool 
# source $(brew --prefix nvm)/nvm.sh
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ignore lines matching the previous history entry. Prevents up arrow through
# a bunch of ls commands, etc.
export HISTCONTROL=ignoredups

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Auto expand directory names with results of word expansion when performing
# filename completion
shopt -s direxpand

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
# if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
# 	. $(brew --prefix)/share/bash-completion/bash_completion
# fi

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# add tab completion for vault. install with `vault -autocomplete-install` then remove the line from bashrc.
# [ -e "/usr/local/bin/vault" ] && complete -C /usr/local/bin/vault vault

# Add tab auto-completion for terraform
# [ -s /usr/local/opt/terraform@0.13/bin/terraform ] && complete -C /usr/local/opt/terraform@0.13/bin/terraform terraform


# source grc for colorizations
if [ -f "$(brew --prefix grc)"/etc/grc.bashrc ]; then
    source "$(brew --prefix grc)"/etc/grc.bashrc
fi

# set up virtual environments for python and Go(to be removed later on)
# if command -v pyenv 1>/dev/null 2>&1; then
# 	# eval "$(pyenv init --path)"
# 	eval "$(pyenv init -)"
# 	eval "$(pyenv virtualenv-init -)"
# fi

# [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#  eval "$(jenv init -)"

#  Gcloud

# if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
# 	source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
# 	source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
# fi

# trap cleanup EXIT
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
