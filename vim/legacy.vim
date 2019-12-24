" ===================
" Editor
" -------------------
" " Plug 'Yggdroot/indentLine'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'terryma/vim-expand-region'
" Plug 'matze/vim-move'
" Plug 'tpope/vim-eunuch'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'dkprice/vim-easygrep'
" Plug 'wesQ3/vim-windowswap'
"
" Plug 'tpope/vim-rsi'
" Plug 'dhruvasagar/vim-table-mode'
"
" ===================
" Appearance
" -------------------
" Plug 'tomasr/molokai'
" Plug 'chriskempson/base16-vim'
" Plug 'baskerville/bubblegum'
"
" ===================
" Languages
" -------------------
" Plug 'AndrewRadev/splitjoin.vim'


" Plug 'mattn/emmet-vim'
" Plug 'chrisbra/Colorizer'

" Plug 'dag/vim-fish'

" " ruby
" Plug 'tpope/vim-endwise'
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'rking/pry-de', { 'rtp': 'vim' }
" Plug 'skalnik/vim-vroom'
"
" Plug 'kchmck/vim-coffee-script'
" Plug 'isRuslan/vim-es6'

" Plug 'mhinz/vim-startify'
" Plug 'kshenoy/vim-signature'
" Plug 'scrooloose/syntastic'

" Plug 'svermeulen/vim-easyclip'
" Plug 'easymotion/vim-easymotion'

" neobundle 'tommcdo/vim-exchange'
" neobundle 'bronson/vim-visual-star-search'
" neobundle 'godlygeek/tabular'

" ===================
" Editor {{{
" -------------------
set foldlevel=10

" vim-table-mode
" let g:table_mode_corner="|"
"
"
" " }}}

" " ===================
" " Languages
" " -------------------
"
" " vim-textobj-rubyblock required
" " runtime macros/matchit.vim
"
" let g:colorizer_auto_filetype='css,html,scss'


" ===================
" Keymap
" -------------------
" " https://www.progclub.org/blog/2014/12/06/fixing-meta-keys-in-vim-via-mac-os-x-terminal-app/
" " http://stackoverflow.com/questions/26310077/use-cmd-mappings-in-console-vim
" " Fix meta-keys on iTerm2
" let c='a'
" while c <= 'z'
"   exec "set <M-".c.">=\<Esc>".c
"   let c = nr2char(1+char2nr(c))
" endw
"
" " Quickly edit your macros
" nnoremap <leader>m  :<c-u><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
"
" " Opens an edit command with the path of the currently edited file filled in
" " Normal mode: <Leader>e
" map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"
" " Opens a tab edit command with the path of the currently edited file filled in
" " Normal mode: <Leader>t
" map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
"
" " Inserts the path of the currently edited file into a command
" " Command mode: Ctrl+P
" " cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
"
" " Press ^F from insert mode to insert the current file name
" " imap <C-F> <C-R>=expand("%")<CR>
"
" nmap <Leader><Leader> V
"
" let g:HardMode_level = 'wannabe'
" " autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
"
" " ===================
" "  FileTypes {{{
" " -------------------
" " autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
" " autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=2
" autocmd FileType vim setlocal foldmethod=marker
" autocmd BufRead,BufNewFile .eslintrc setfiletype yaml
" autocmd FileType scss setlocal expandtab shiftwidth=2 tabstop=2
" " }}}

"
