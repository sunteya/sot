#! bash
[ -n "${local_bashrc_running}" ] && return
local_bashrc_running=1
[ -r /etc/bashrc -a -z "${system_bashrc_runned}" ] && source /etc/bashrc
[ -r ~/.profile -a -z "${local_profile_loaded}" ] && source ~/.profile
unset local_bashrc_running


# Bash Settings
export HISTFILESIZE=8000
export HISTSIZE=$HISTFILESIZE

if [ -n "$PS1" ]; then
	source $HOME/.bash/colors.sh
	source $HOME/.bash/alias.sh
	source $HOME/.bash/prompts.sh
fi


if [[ "$(uname)" == "Darwin" ]]; then # MAC
	source $HOME/.bash/darwin.sh
fi

# rbenv
if [[ -d $HOME/.rbenv/bin ]]; then
	export PATH=$HOME/.rbenv/bin:$PATH
	eval "$(rbenv init -)"
fi

# This loads NVM
[[ -s /Users/sunteya/.nvm/nvm.sh ]] && . /Users/sunteya/.nvm/nvm.sh 

if [ -r ~/.localrc ]; then
	source ~/.localrc
fi
