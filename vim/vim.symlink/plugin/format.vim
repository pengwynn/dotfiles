" Reformat visual selection as JSON
vnoremap <Leader>j !jq '.'<CR>

" Github => GitHub
map <Leader>gh :%s/Github/GitHub/g<CR>

" Per-language tab settings
" =========================
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType * setlocal formatprg=
autocmd FileType json setlocal formatprg=jq\ -sM\ .


" Snippets
autocmd BufRead,BufNewFile,BufEnter *spec.js UltiSnipsAddFiletypes javascript-jasmine-arrow

" Neoformat
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.json Neoformat

" let g:ale_fix_on_save = 1
" let g:ale_fixers = { 'javascript': ['prettier']  }

let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']

nnoremap ]r :ALENextWrap<cr>
nnoremap [r :ALEPreviousWrap<cr>]
