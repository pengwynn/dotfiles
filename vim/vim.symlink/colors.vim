function! SetBackgroundForIterm()
  if $ITERM_PROFILE == "solarized-light"
    colorscheme base16-solarized
    set background=light
  elseif $ITERM_PROFILE == "tomorrow"
    colorscheme base16-tomorrow
    set background=light
  elseif $ITERM_PROFILE == "tomorrow-night"
    colorscheme base16-tomorrow
    set background=dark
  else
    colorscheme base16-solarized
    set background=dark
  end
endfunction

map <Leader>b :call SetBackgroundForIterm()<CR>
