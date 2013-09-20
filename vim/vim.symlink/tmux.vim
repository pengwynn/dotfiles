let g:tmux_is_last_pane = 0
au WinEnter * let g:tmux_is_last_pane = 0

" Like `wincmd` but also change tmux panes instead of vim windows when needed.
function! TmuxWinCmd(direction)
  let nr = winnr()
  let tmux_last_pane = (a:direction == 'p' && g:tmux_is_last_pane)
  if !tmux_last_pane
    " try to switch windows within vim
    exec 'wincmd ' . a:direction
  endif
  " Forward the switch panes command to tmux if:
  " a) we're toggling between the last tmux pane;
  " b) we tried switching windows in vim but it didn't have effect.
  if tmux_last_pane || nr == winnr()
    let cmd = 'tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR')
    call system(cmd)
    redraw! " because `exec` fucked up the screen. why is this needed?? arrghh
    let g:tmux_is_last_pane = 1
  else
    let g:tmux_is_last_pane = 0
  endif
endfunction

" navigate between split windows/tmux panes
nmap <c-j> :call TmuxWinCmd('j')<cr>
nmap <c-k> :call TmuxWinCmd('k')<cr>
nmap <c-h> :call TmuxWinCmd('h')<cr>
nmap <c-l> :call TmuxWinCmd('l')<cr>
nmap <c-\> :call TmuxWinCmd('p')<cr>
