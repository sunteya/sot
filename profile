export local_profile_loaded=1

if [ "zh_CN.UTF-8" == "$LANG" ]; then
	export LANG=en_US.UTF-8
fi

if [ "UTF-8" == "$LC_CTYPE" ]; then
	export LANG=en_US.UTF-8
	export LC_CTYPE=en_US.UTF-8
	# export LC_ALL=en_US.UTF-8
fi

# Path Setting
if [ "$(uname)" == "Darwin" ]; then
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH
	export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH

	export JAVA_HOME=/Library/Java/Home
	export JAVA_TOOL_OPTIONS="-Duser.language=en -Duser.country=US"
fi

[ -d "$HOME/.local/bin" ] && export PATH=$HOME/.local/bin:$PATH

if [ "${BASH-no}" != "no" ]; then
	[ -r ~/.bashrc ] && source ~/.bashrc
fi
