
[[ -z "$PS1" ]] && return;


if [[ $(type -P brew) ]]; then
	[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
	[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
fi


export EDITOR="subl -w"
export GEM_EDITOR="subl"

