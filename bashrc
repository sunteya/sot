[ -n "${local_bashrc_running}" ] && return
local_bashrc_running=1
[ -r /etc/bashrc -a -z "${system_bashrc_runned}" ] && source /etc/bashrc
[ -r ~/.profile -a -z "${local_profile_loaded}" ] && source ~/.profile
unset local_bashrc_running


# Bash Settings
export HISTFILESIZE=3000
export HISTSIZE=$HISTFILESIZE

if [ -n "$PS1" ]; then
	# Settings
	export EDITOR="subl -w"
	export GEM_EDITOR="subl"

	source $HOME/.bash/completions.sh
	source $HOME/.bash/colors.sh
	source $HOME/.bash/alias.sh
	source $HOME/.bash/prompts.sh
fi


if [ -r ~/.localrc ]; then
	source ~/.localrc
fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
