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

let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linter_aliases = {'jasmine': ['javascript']}
let g:ale_linters = {
\    'javascript': ['eslint', 'prettier'],
\    'svelte': ['stylelint', 'eslint'],
\    'markdown': ['write-good'],
\    'typescript': ['eslint', 'tslint', 'tsserver'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'svelte': ['prettier'],
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

let g:neoformat_typescriptreact_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
    \ 'stdin': 1
    \ }
let g:neoformat_enabled_typescriptreact = ['tsfmt', 'prettier']
let g:neoformat_svelte_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_svelte = ['prettier']

let g:neoformat_jasmine_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_jasmine = ['prettier']

let g:neoformat_liquid_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_liquid = ['prettier']

let g:javascript_plugin_jsdoc = 1

highlight Comment cterm=italic

augroup mkjs_ft
  au!
  autocmd BufNewFile,BufRead *.mkjs set syntax=javascript
augroup END

" Liquid
au BufNewFile,BufRead *.liquid					set ft=liquid

au BufNewFile,BufRead */_layouts/*.html,*/_includes/*.html	set ft=liquid
au BufNewFile,BufRead *.html,*.xml,*.textile
      \ if getline(1) == '---' | set ft=liquid | endif
au BufNewFile,BufRead *.markdown,*.mkd,*.mkdn,*.md
      \ if getline(1) == '---' |
      \   let b:liquid_subtype = 'markdown' |
      \   set ft=liquid |
      \ endif
