#!/usr/bin/env bash

# ignore Apple default shell is now zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS='--appdir=/Applications --fontdir=/Library/Fonts'

# Default Prompt settings
# \h - hostname up to the first '.'
# \W - THe base name of the current working directory with $HOME abbreviated with a tilde
# \u - The username of the current user
export PS1="\[\033[0;33m\]\u\[\033[0m\]\[\033[0;34m\]@\h\[\033[0m\]:\[\033[0;32m\]\W \$ \[\033[0m\]"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	# shellcheck source=/dev/null
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# setup nodejs NVM tool, must run before bash completion sourcing to be
# automatically picked up
# shellcheck source=/dev/null
source "$(brew --prefix nvm)/nvm.sh"
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# add tab completion for vault. install with `vault -autocomplete-install` then remove the line from bashrc.
# [ -e "/usr/local/bin/vault" ] && complete -C /usr/local/bin/vault vault

# Add tab auto-completion for terraform
# [ -s /usr/local/opt/terraform@0.13/bin/terraform ] && complete -C /usr/local/opt/terraform@0.13/bin/terraform terraform

# Add bash completion for Docker
docker_etc=/Applications/Docker.app/Contents/Resources/etc
if [ -d ${docker_etc} ]; then
	docker_completion="${BREW_PREFIX}/etc/bash_completion.d/docker"
	if [ ! -f "${docker_completion}" ]; then
		ln -s ${docker_etc}/docker.bash-completion "${docker_completion}"
	fi

	docker_compose_completion="${BREW_PREFIX}/etc/bash_completion.d/docker-compose"
	if [ ! -f "${docker_compose_completion}" ]; then
		ln -s ${docker_etc}/docker-compose.bash-completion "${docker_compose_completion}"
	fi
fi

# Add bash completion for kubectl
if [ ! -f "${BREW_PREFIX}/etc/bash_completion.d/kubectl" ]; then
	if type kubectl &>/dev/null; then
		kubectl completion bash > "${BREW_PREFIX}/etc/bash_completion.d/kubectl"
	fi
fi

# source grc for colorizations
if [ -f "${BREW_PREFIX}/etc/grc.sh" ]; then
	export GRC_ALIASES=true
	# shellcheck source=/dev/null
    source "${BREW_PREFIX}/etc/grc.sh"
fi

# Add tab completion for many Bash commands
if type brew &>/dev/null; then
	if [[ -r "${BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
		# shellcheck source=/dev/null
		source "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
	else
		# Ensure existing Homebrew v1 completions continue to work
		for COMPLETION in "${BREW_PREFIX}/etc/bash_completion.d"*; do
			# shellcheck source=/dev/null
			[[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
		done
	fi
fi

# set up virtual environments for python and Go(to be removed later on)
# if command -v pyenv 1>/dev/null 2>&1; then
# 	# eval "$(pyenv init --path)"
# 	eval "$(pyenv init -)"
# 	eval "$(pyenv virtualenv-init -)"
# fi

# [[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

#  eval "$(jenv init -)"

#  Gcloud

# if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
# 	source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
# 	source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
# fi

# trap cleanup EXIT
# shellcheck source=/dev/null
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
