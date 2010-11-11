# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion

# System
export CLICOLOR='true'
export EDITOR="mate -w"
export JAVA_HOME=/Library/Java/Home

# RVM
export rvm_pretty_print_flag=1
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

export PATH=$HOME/bin:$HOME/.bin:$HOME/.sot/bin:$PATH

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

