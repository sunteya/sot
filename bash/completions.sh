if [[ $(type -P brew) ]]; then
	[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
fi

[ -r $rvm_path/scripts/completion ] && source $rvm_path/scripts/completion