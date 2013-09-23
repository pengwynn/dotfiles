" Run the it2prof shell script to get the current iTerm2 profile from
" ENV or TMUX environment and set a color scheme of the same name.
function! SetColorSchemeFromItermProfile()
  call SetColorScheme(system('it2prof'))
endfunction

" A little smarts to set the background based on the name of the iTerm
" profile when setting the color scheme.
function! SetColorScheme(profile)
  colorscheme "" . a:profile
  if matchend(a:profile, "light")
    set bg=light
  else
    set bg=dark
  end
endfunction

" Set a color scheme and attempt to load an appropriate iTerm profile 
" based on the name of the color scheme.
function! SetTerminalProfile(...)
  if a:0 == 1
    " Set the color scheme and assume dark
    let a:profile = a:1
    set background=dark
    exec 'silent :!it2prof ' . a:profile
  elseif a:0 == 2
    " Set the color scheme and background
    let a:profile = a:1
    let &background = a:2
    " iTerm profiles must end in .light for this to work
    if a:2 == 'light'
      let a:profile .= '.light'
    end
    exec 'silent :!it2prof ' . a:profile
  end
endfunction

map <Leader>c :call SetColorSchemeFromItermProfile()<CR>
command! -nargs=* -complete=color TerminalProfile call SetTerminalProfile(<f-args>)
