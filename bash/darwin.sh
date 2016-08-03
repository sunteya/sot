[ -z "$PS1" ] && return


if [ $(type -P brew) ] ; then
	[ -f `brew --prefix`/etc/bash_completion ] && source `brew --prefix`/etc/bash_completion

	if [ "$BASH_VERSINFO" == "4" ] && [ -f $(brew --prefix)/share/bash-completion/bash_completion  ]; then
		source $(brew --prefix)/share/bash-completion/bash_completion
	fi

	[ -s $(brew --prefix)/etc/autojump.sh ] && source $(brew --prefix)/etc/autojump.sh
fi
