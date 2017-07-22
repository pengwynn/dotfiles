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
