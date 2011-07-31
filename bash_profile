# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH
[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion

# RVM
if [ -s $HOME/.rvm/scripts/rvm ]; then
	export rvm_pretty_print_flag=1
	source $HOME/.rvm/scripts/rvm
	source $rvm_path/scripts/completion
fi

# Ruby
BUNDLED_COMMANDS="rackup rails rake rspec ruby spork thin unicorn annotate"
[ -f $HOME/.bash/bundler-exec.sh ] && source $HOME/.bash/bundler-exec.sh

 #.sot
export PATH=$HOME/.sot/bin:$PATH


# User Settings
export CLICOLOR='true'
export EDITOR="mate -w"
export JAVA_HOME=/Library/Java/Home
export PATH=$HOME/bin:$HOME/.bin:$PATH

export HISTFILESIZE=3000
export HISTSIZE=$HISTFILESIZE

[ -f $HOME/.bash/bash-prompt.sh ] && source $HOME/.bash/bash-prompt.sh


if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
