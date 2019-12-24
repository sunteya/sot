call neobundle#append()
  NeoBundle 'wikitopian/hardmode'

  NeoBundle 'ntpeters/vim-better-whitespace'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'jiangmiao/auto-pairs'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'junegunn/limelight.vim'
  NeoBundle 'junegunn/vim-peekaboo'

  " Keymap
  NeoBundle 'tpope/vim-unimpaired'

  " Git
  NeoBundle 'airblade/vim-gitgutter'
  " NeoBundle 'tpope/vim-fugitive'

  " File explorer
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'jistr/vim-nerdtree-tabs'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'

  " Status/tabline
  NeoBundle 'bling/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'

  " Narrow search
  NeoBundle 'Shougo/denite.nvim'

  " Code completion
  if has('nvim')
    NeoBundle 'Shougo/deoplete.nvim'
  else
    NeoBundle 'Shougo/neocomplete.vim'
  endif
call neobundle#end()

" ===================
"  NERDTree
" -------------------
let NERDTreeMinimalUI=1
" Toggle NERDTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" ===================
"  Airline
" -------------------
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z = airline#section#create(['%{&tabstop}:%{&shiftwidth}',' %3p%% ',g:airline_symbols.linenr,'%3l:%c'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" ===================
"  Code completion
" -------------------
if has('nvim')
  let g:deoplete#enable_at_startup = 1
else
  let g:neocomplete#enable_at_startup = 1

  " Called once right before you start selecting multiple cursors
  function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
      exe 'NeoCompleteLock'
    endif
  endfunction

  " Called once only when the multiple selection is canceled (default <Esc>)
  function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
      exe 'NeoCompleteUnlock'
    endif
  endfunction
endif


" ===================
"  Denite
" -------------------
nmap <C-p> :Denite file_rec buffer<CR>

" ===================
"  Keymap
" -------------------
" Quick save and exit
nmap <Leader><Leader>q :q<CR>
nmap <Leader>w :w<CR>

" Copy & paste to system clipboard
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>P "+P

" Highlight last inserted text
nnoremap gV `[v`]
