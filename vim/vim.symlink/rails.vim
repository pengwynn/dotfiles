" Rails
" ==========

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

autocmd User Rails Rnavcommand steps       features/step_definitions          -glob=**/*
autocmd User Rails Rnavcommand routes      config                             -glob=*.*  -default=routes.rb -suffix=
autocmd User Rails Rnavcommand initializer config/initializers                -glob=**/*
autocmd User Rails Rnavcommand factories   spec test                          -glob=**/* -default=factories
autocmd User Rails Rnavcommand job         app/jobs                           -glob=**/*                    -suffix=.rb
autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*                    -suffix=.jst.ejs
autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*                    -suffix=.coffee
autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*                    -suffix=.coffee
autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*                    -suffix=.coffee
autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*                    -suffix=.coffee


" Privatize Ruby methods
" ===========

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
