" Reformat visual selection as JSON
vnoremap <Leader>j !jq '.'<CR>

" Github => GitHub
map <Leader>gh :%s/Github/GitHub/g<CR>

" Per-language tab settings
" =========================
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType * setlocal formatprg=


" Neoformat
" autocmd BufWritePre *.js,*.jsx Neoformat
autocmd BufWritePre *.graphql Neoformat

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_enabled = 1

let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']

nnoremap ]r :ALENextWrap<cr>
nnoremap [r :ALEPreviousWrap<cr>
nnoremap <leader>f :ALEFix<cr>
let g:neoformat_try_formatprg = 1
