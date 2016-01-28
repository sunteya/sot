export local_profile_loaded=1

# Path Setting
if [[ "$(uname)" == "Darwin" ]]; then
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH
	export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH

	export JAVA_HOME=/Library/Java/Home
	export JAVA_TOOL_OPTIONS="-Duser.language=en -Duser.country=US"
fi

export PATH=$HOME/.sot/bin:$PATH
export PATH=$HOME/bin:$HOME/.bin:$PATH



if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && source ~/.bashrc
fi

