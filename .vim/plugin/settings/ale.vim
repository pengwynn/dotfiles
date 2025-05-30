let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_fixers = {'svelte': ['eslint', 'prettier', 'prettier_standard']}
let g:ale_linters = {
\   'javascript': ['cspell', 'eslint', 'standard', 'tslint', 'tsserver', 'typecheck', 'xo'],
\   'typescriptreact': ['cspell', 'eslint', 'standard', 'tslint', 'tsserver', 'typecheck', 'xo'],
\   'svelte': ['stylelint', 'eslint']
\}
let g:ale_linters_ignore = {
\   'typescript': ['deno'],
\   'javascript': ['deno'],
\   'typescriptreact': ['deno'],
\}
