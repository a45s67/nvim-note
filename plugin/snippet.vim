" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="`l"
let g:UltiSnipsJumpForwardTrigger="`l"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Get all currebt snippets
" :redir @a
" :echo GetAllSnippets()
" :redir END
" Then "ap
function! GetAllSnippets()
  call UltiSnips#SnippetsInCurrentScope(1)
  let list = []
  for [key, info] in items(g:current_ulti_dict_info)
    let parts = split(info.location, ':')
    call add(list, {
      \"key": key,
      \"path": parts[0],
      \"linenr": parts[1],
      \"description": info.description,
      \})
  endfor
  return list
endfunction

