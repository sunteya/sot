#! bash
[ -n "${local_bashrc_running}" ] && return
local_bashrc_running=1
[ -r /etc/bashrc -a -z "${system_bashrc_runned}" ] && source /etc/bashrc
[ -r ~/.profile -a -z "${local_profile_loaded}" ] && source ~/.profile
unset local_profile_loaded
unset local_bashrc_running

if [ -n "$PS1" ]; then
	# Bash Settings
	export HISTFILESIZE=8000
	export HISTSIZE=$HISTFILESIZE

	source $HOME/.bash/colors.sh
	source $HOME/.bash/alias.sh
	source $HOME/.bash/prompts.sh
fi

if [ "$(uname)" == "Darwin" ]; then # MAC
	source $HOME/.bash/darwin.sh
fi

if [ -r ~/.localrc ]; then
	source ~/.localrc
fi
