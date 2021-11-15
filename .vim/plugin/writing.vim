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
