" Reformat visual selection as JSON
vnoremap <Leader>j !python -m json.tool<CR>

" Github => GitHub
map <Leader>g :%s/Github/GitHub/g<CR>

" Per-language tab settings
" =========================
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
