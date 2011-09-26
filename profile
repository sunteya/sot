export local_profile_loaded=1


# Path Setting
if [[ "$(uname)" == "Darwin" ]]; then
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH
	export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH
fi

export PATH=$HOME/.sot/bin:$PATH
export PATH=$HOME/bin:$HOME/.bin:$PATH
export JAVA_HOME=/Library/Java/Home

# RVM
if [ -z "${rvm_version}" -a -s $HOME/.rvm/scripts/rvm ]; then
	source $HOME/.rvm/scripts/rvm
fi


if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && source ~/.bashrc
fi

