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

let g:ale_linters = {
\    'javascript': ['eslint', 'prettier'],
\    'markdown': ['write-good'],
\    'typescript': ['tslint', 'tsserver'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier', 'tslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_enabled = 1
highlight ALEWarning ctermbg=Yellow ctermfg=Red
highlight ALEError ctermbg=Red ctermfg=LightRed


let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '']
" let g:ale_completion_enabled = 1

nnoremap ]r :ALENextWrap<cr>
nnoremap [r :ALEPreviousWrap<cr>
nnoremap <leader>f :ALEFix<cr>
let g:neoformat_try_formatprg = 1

let g:neoformat_sql_sqlfmt = {
            \ 'exe': 'sqlfmt',
            \ 'args': ['-u'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_sql = ['sqlfmt']

let g:javascript_plugin_jsdoc = 1
