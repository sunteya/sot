if [ "zh_CN.UTF-8" = "$LANG" ]; then
	export LANG=en_US.UTF-8
fi

if [ "UTF-8" = "$LC_CTYPE" ]; then
	export LANG=en_US.UTF-8
	export LC_CTYPE=en_US.UTF-8
	# export LC_ALL=en_US.UTF-8
fi

# Path Setting
if [ "$(uname)" = "Darwin" ]; then
	[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
	#export JAVA_TOOL_OPTIONS="-Duser.language=en -Duser.country=US"
fi

if [ -d "$HOME/.local/bin" ]; then
	export PATH=$HOME/.local/bin:$PATH
fi

if [ -f "$HOME/.profile.local" ]; then
	source "$HOME/.profile.local"
fi
