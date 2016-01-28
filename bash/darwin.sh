
[[ -z "$PS1" ]] && return;


if [[ $(type -P brew) ]]; then
	[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion

	if [ -f $(brew --prefix)/share/bash-completion/bash_completion  ]; then
		. $(brew --prefix)/share/bash-completion/bash_completion
	fi

	[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
fi


export EDITOR="subl -w"
export GEM_EDITOR="subl"

