function! SetBackgroundForIterm()
  if $ITERM_PROFILE == "SolarizedLight"
    colorscheme solarized
    set background=light
  elseif $ITERM_PROFILE == "Tomorrow"
    colorscheme Tomorrow
    set background=light
  elseif $ITERM_PROFILE == "TomorrowNight"
    colorscheme Tomorrow-Night-Eighties
    set background=dark
  else
    colorscheme solarized
    set background=dark
  end
endfunction

map <Leader>b :call SetBackgroundForIterm()<CR>
