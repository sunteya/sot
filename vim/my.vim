" http://github.com/jferris/config_files/blob/master/vimrc
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://coolshell.cn/articles/5426.html
" http://statico.github.io/vim2.html
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" http://pchm.co/from-textmate-to-vim/
" https://raw.githubusercontent.com/nvie/vimrc/master/vimrc
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

source ~/.vim/sensible.vim
source ~/.vim/basic.vim

" curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin()
  NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

source ~/.vim/editor.vim
source ~/.vim/language.vim

" Local config
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

NeoBundleCheck
