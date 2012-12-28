" Navigation
" ==========
" Move between wrapped lines as though they were physical lines.
noremap k gk
noremap j gj
noremap <up> g<up>
noremap <down> g<down>

" Easier start & end of line.
noremap H ^
nnoremap L $
vnoremap L $h

" Windows
" ==========

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle paste
nnoremap <leader>p :set invpaste paste?<CR>
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

" Remove whitespace
map <Leader>W :%s/\s\+$//e<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Clear last search
nnoremap <Leader>m :set hlsearch!<CR>
