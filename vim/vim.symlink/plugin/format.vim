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
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5\ --no-semi
autocmd FileType javascript.jsx setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5\ --no-semi
let g:neoformat_try_formatprg = 1
