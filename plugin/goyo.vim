
let g:goyo_trigger=0
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  let g:goyo_trigger=1
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif

  let g:goyo_trigger=0
  set showmode
  set showcmd
  set scrolloff=5
  source $MYVIMRC
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


nnoremap <expr> <leader>z g:goyo_trigger ? ":q<CR>" : ":Goyo 120x40<CR>"
