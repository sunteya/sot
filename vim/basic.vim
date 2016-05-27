set nowritebackup

" Tabs, 4 spaces
set tabstop=4
set shiftwidth=4
set noexpandtab

" Command mode completion like bash
set wildmode=longest,list

" Switch wrap off for everything
set nowrap

" Case only matters with mixed case expressions
" set ignorecase
set smartcase

" Vim mouse scrolling
set mouse=a
" set ttymouse=xterm

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Numbers
set number
set numberwidth=5

" highlight matches
set hlsearch

" Display extra whitespace
" Use the same symbols as textmate for tabstops and eols
set list listchars=tab:▸\ ,trail:.,extends:>,eol:¬

" No help, please
nmap <F1> <Esc>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Hide search highlighting
map <Leader>h :set invhls<CR>

" Saner behavior of n and N
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" Don't lose selection when shifting sidewards
xnoremap >  >gv
xnoremap <  <gv

