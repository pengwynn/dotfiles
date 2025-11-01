call plug#begin('~/.vim/vendor')

if !has('nvim') && !exists('g:gui_oni') | Plug 'tpope/vim-sensible' | endif
Plug 'tinted-theming/tinted-vim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'epmatsw/ag.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'inside/vim-textobj-jsxattr'
Plug 'jayflo/vim-skip'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'junegunn/vim-github-dashboard'
Plug 'justinmk/vim-gtfo'
Plug 'kana/vim-textobj-user'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-sentence'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tek/vim-textobj-ruby'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/gem.vim'
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'cappyzawa/starlark.vim'
""" copilot chat
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --ts-completer --rust-completer ' }

call plug#end()

lua << EOF
require("CopilotChat").setup {
  -- See Configuration section for options
}

EOF
" Per-directory .vimrc files
set exrc
set secure

" Syntax
" ======

syntax on
syntax enable
set t_Co=256

" General Config
" ==============

let mapleader='\'
set encoding=utf-8
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set clipboard=unnamed           " Use system clipboard
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Faster gitgutter/linting updates
set updatetime=100

" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Hilight searches by default
set ignorecase       " Ignore case when searching
set smartcase        " Override ignorecase if search contains capitals
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" Turn Off Swap Files
" ===================

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
if has('persistent_undo')
  set undodir=~/.vim/backups
  set undofile
endif

" Neovim-specific settings
if has('nvim')
  " True color support
  set termguicolors
  " Hide the toolbar in GUI
  if has('gui_running')
    set guioptions-=T
  endif
endif

" Indentation and Display
" =======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set nowrap                            " Don't wrap lines
set linebreak                         " Wrap lines at convenient points

" Folds
" =====

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========

set wildmode=longest:full,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
if has('nvim') || has('patch-8.1.1880')
  set wildoptions=pum           " Show completion matches in a popup menu
endif
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Status Line
" ===========

set statusline=                                 " Override default
set statusline+=%{fugitive#statusline()[4:-2]}  " Show fugitive git info
set statusline+=\ %f\ %m\ %r                    " Show filename/path
set statusline+=%=                              " Set right-side status info after this line
set statusline+=%l/%L:%v                        " Set <line number>/<total lines>:<column>
set statusline+=\                               " Set ending space


if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif


" Git Gutter
" ==========
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" GH Dashboard
" ==========
let g:github_dashboard = { 'username': 'pengwynn', 'password': $GITHUB_TOKEN }

" JSX in .js files
" ==========
let g:jsx_ext_required = 0

" Committing
" ==========
"
" BufRead seems more appropriate here but for some reason the final `wincmd p` doesn't work if we do that.
autocmd VimEnter COMMIT_EDITMSG call OpenCommitMessageDiff()
function OpenCommitMessageDiff()
  " Save the contents of the z register
  let old_z = getreg("z")
  let old_z_type = getregtype("z")

  try
    call cursor(1, 0)
    let diff_start = search("^diff --git")
    if diff_start == 0
      " There's no diff in the commit message; generate our own.
      let @z = system("git diff --cached -M -C")
    else
      " Yank diff from the bottom of the commit message into the z register
      :.,$yank z
      call cursor(1, 0)
    endif

    " Paste into a new buffer
    vnew
    normal! V"zP
  finally
    " Restore the z register
    call setreg("z", old_z, old_z_type)
  endtry

  " Configure the buffer
  set filetype=diff noswapfile nomodified readonly
  silent file [Changes\ to\ be\ committed]

  " Get back to the commit message
  wincmd p
endfunction

" Autocmd
" ==========
"
" Automatically reload vimrc when it's saved
autocmd! BufWritePost vimrc.symlink so ~/.vimrc

" Show relative paths in buffer list
autocmd BufReadPost * silent! lcd .

" Help gf find some things
autocmd Filetype javascript,typescript set path=.,src
autocmd Filetype javascript,typescript set suffixesadd+=.ts,.tsx

" Strip whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e

" Filetype overrides
" ==================

autocmd! BufRead,BufNewFile *Gemfile,Rakefile,Procfile,Guardfile setf ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile */nginx/*.conf set filetype=nginx
au BufRead,BufNewFile *.md set filetype=markdown
au BufReadPost .env.* set syntax=sh

" Resize splits on window resize
au VimResized * exe "normal! \<c-w>="

" Markdown
augroup markdown
    au!
    autocmd Syntax markdown setlocal textwidth=79
    if exists("&colorcolumn")
        autocmd Syntax markdown setlocal colorcolumn=80
    endif
augroup END

" Highlight words to avoid in tech writing
" =======================================
"
"   obviously, basically, simply, of course, clearly,
"   just, everyone knows, However, So, easy

"   http://css-tricks.com/words-avoid-educational-writing/

highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
	match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
autocmd FileType markdown call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()
autocmd FileType asciidoc nnoremap <buffer><silent><leader>z :silent exec '!open -a Firefox %:p &' | exec ':redraw!'

command! -nargs=* Wrap set wrap linebreak nolist

" VimWiki
nmap <leader>ts :.! TZ='America/Chicago' date -R<CR>

" Navigation
" ==========
" Move between wrapped lines as though they were physical lines.
" noremap k gk
" noremap j gj
noremap <up> g<up>
noremap <down> g<down>

" Easier start & end of line.
noremap H ^
nnoremap L $
vnoremap L $h

" Selection
" ==========
"
" select all
map <Leader>a ggVG

" Go to matching symbol with tab
nnoremap <tab> %
vnoremap <tab> %


" Windows
" ==========

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle paste
nnoremap <leader>p :set invpaste paste?<CR>

" Toggle case
nmap <F9> :set ignorecase! ignorecase?<CR>

" Tagbar
let g:tagbar_ctags_bin = '/opt/github/homebrew/bin/ctags'
" Toggle tagbar
nmap <Leader>t :TagbarToggle<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" Quick escape from insert mode
inoremap jj <esc>

" wrap current paragraph
nnoremap <leader>w gqip

" Edit vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Visual find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Remove whitespace
map <Leader>W :%s/\s\+$//e<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Clear last search
nnoremap <space> :set hlsearch! hlsearch?<CR>

" Fuzzy find files
nnoremap <silent> <leader>g :GFiles<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %


let g:netrw_altv=1


let g:vim_svelte_plugin_use_typescript = 1
