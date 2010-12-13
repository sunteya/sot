# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH
[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion

# RVM
export rvm_pretty_print_flag=1
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

# .sot
export PATH=$HOME/.sot/bin:$PATH


# User Settings
export CLICOLOR='true'
export EDITOR="mate -w"
export JAVA_HOME=/Library/Java/Home
export PATH=$HOME/bin:$HOME/.bin:$PATH

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
