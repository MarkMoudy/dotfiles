
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

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# add tab completion for vault. install with `vault -autocomplete-install` then remove the line from bashrc.
[ -e "/usr/local/bin/vault" ] && complete -C /usr/local/bin/vault vault


# source grc for colorizations
if [ -f $(brew --prefix grc)/etc/grc.bashrc ]; then
    source $(brew --prefix grc)/etc/grc.bashrc
fi

# Start up ssh-agent
export SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add
     /usr/bin/ssh-add -A &> /dev/null;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps ${SSH_AGENT_PID} # doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

## Cleanup ssh-agents on exit
function cleanup {
    echo \"Killing SSH-Agent\"
    kill -9 $SSH_AGENT_PID
}
# trap cleanup EXIT
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
