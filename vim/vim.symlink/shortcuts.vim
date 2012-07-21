" Windows
" ==========

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle paste
nnoremap <F6> :set invpaste paste?<CR>
set pastetoggle=<F6>
set showmode

" Toggle case
nmap <F9> :set ignorecase! ignorecase?<CR>

" Yank from cursor to end of line
nnoremap Y y$


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
inoremap jj <esc>

" wrap current paragraph
nnoremap <leader>w gqip

" Duplicate a selection
" Visual mode: D
vmap D y'>p

