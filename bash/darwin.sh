
[[ -z "$PS1" ]] && return;


if [[ $(type -P brew) ]]; then
	[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
	
	[[ -f `brew --prefix`/etc/autojump.bash ]] && source `brew --prefix`/etc/autojump.bash
fi


export EDITOR="subl -w"
export GEM_EDITOR="subl"

