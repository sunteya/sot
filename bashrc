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

# RVM
if [[ -d $HOME/.rvm/bin ]]; then
	export PATH=$PATH:$HOME/.rvm/bin
	
	if [[ -n "$PS1" ]]; then
		export rvm_pretty_print_flag=1
		source $HOME/.rvm/scripts/rvm
		[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion
	fi
fi

# This loads NVM
[[ -s /Users/sunteya/.nvm/nvm.sh ]] && . /Users/sunteya/.nvm/nvm.sh 

if [ -r ~/.localrc ]; then
	source ~/.localrc
fi
