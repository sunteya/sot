# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH
[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion

# RVM
export rvm_pretty_print_flag=1
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

# Ruby
BUNDLED_COMMANDS="rackup rails rake rspec ruby spork thin unicorn annotate"
[ -f $HOME/.sot/bundler-exec.sh ] && source $HOME/.sot/bundler-exec.sh

# node.js
#export NODE_PATH="/usr/local/lib/node_modules"

 #.sot
export PATH=$HOME/.sot/bin:$PATH


# User Settings
export CLICOLOR='true'
export EDITOR="mate -w"
export JAVA_HOME=/Library/Java/Home
export PATH=$HOME/bin:$HOME/.bin:$PATH

export HISTFILESIZE=3000
export HISTSIZE=$HISTFILESIZE


if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
