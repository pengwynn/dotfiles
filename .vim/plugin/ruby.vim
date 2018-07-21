" Ruby
" ==========

" Run spec under current line
nnoremap <leader>s :!bundle exec rake spec SPEC=%:<c-r>=line('.')<cr><cr>
" Run current spec file
nnoremap <leader>S :!bundle exec rake spec SPEC=%<cr>

function! Privatize()
  let priorMethod = PriorMethodDefinition()
  exec "normal iprivate :" . priorMethod  . "\<Esc>=="
endfunction

function! PriorMethodDefinition()
  let lineNumber = search('def', 'bn')
  let line       = getline(lineNumber)
  if line == 0
    echo "No prior method definition found"
  endif
  return matchlist(line, 'def \(\w\+\).*')[1]
endfunction

map <Leader>p :call Privatize()<CR>
