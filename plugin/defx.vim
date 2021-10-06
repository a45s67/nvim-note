" Copy from dotfile by youtuber @devaslife - https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/after/plugin/defx.rc.vim
"if !exists('g:loaded_defx') | finish | endif

" Define mappings
"cnoreabbrev sf Defx -listed -new
"      \ -columns=indent:mark:icon:icons:filename:git:size
"      \ -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent><F2> :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ -post-action=jump
      \ -split=vertical -winwidth=50 -direction=topleft 
      \ -ignored-files=\  <CR>
      \ :call defx#redraw() <CR>
"     \ `expand('%:p:h')` isearch=`expand('%:p')`<CR>
nnoremap <silent><F1> :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd BufWritePost * call defx#redraw()


autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
" Define mappings
nnoremap <silent><buffer><expr> <CR>
\ defx#is_directory() ?
\ defx#do_action('open'):
\ defx#do_action('multi',['drop','quit'])
nnoremap <silent><buffer><expr> c
\ defx#do_action('copy')
nnoremap <silent><buffer><expr> m
\ defx#do_action('move')
nnoremap <silent><buffer><expr> p
\ defx#do_action('paste')
nnoremap <silent><buffer><expr> l
\ defx#is_directory() ?
\ defx#is_opened_tree() ?
\ 'j':
\ defx#do_action('open_tree'):
\ defx#do_action('multi',['drop'])
nnoremap <silent><buffer><expr> T
\ defx#do_action('open', 'tabnew')
nnoremap <silent><buffer><expr> E
\ defx#do_action('open', 'vsplit')
nnoremap <silent><buffer><expr> P
\ defx#do_action('drop')
nnoremap <silent><buffer><expr> o
\ defx#do_action('open_tree', 'toggle')
nnoremap <silent><buffer><expr> K
\ defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N
\ defx#do_action('new_file')
nnoremap <silent><buffer><expr> M
\ defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> C
\ defx#do_action('toggle_columns',
\                'mark:indent:icon:filename:type:size:time')
nnoremap <silent><buffer><expr> S
\ defx#do_action('toggle_sort', 'time')
nnoremap <silent><buffer><expr> d
\ defx#do_action('remove')
nnoremap <silent><buffer><expr> r
\ defx#do_action('rename')
nnoremap <silent><buffer><expr> !
\ defx#do_action('execute_command')
nnoremap <silent><buffer><expr> x
\ defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy
\ defx#do_action('yank_path')
nnoremap <silent><buffer><expr> .
\ defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> ;
\ defx#do_action('repeat')
nnoremap <silent><buffer><expr> h
\ defx#do_action('close_tree')
nnoremap <silent><buffer><expr> ~
\ defx#do_action('cd')
nnoremap <silent><buffer><expr> <F2>
\ defx#do_action('quit')
nnoremap <silent><buffer><expr> q
\ defx#do_action('quit')
nnoremap <silent><buffer><expr> <Space>
\ defx#do_action('toggle_select') . 'j'
nnoremap <silent><buffer><expr> *
\ defx#do_action('toggle_select_all')
nnoremap <silent><buffer><expr> j
\ line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k
\ line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> <C-l>
\ defx#do_action('redraw')
nnoremap <silent><buffer><expr> <C-g>
\ defx#do_action('print')
nnoremap <silent><buffer><expr> cd
\ defx#do_action('change_vim_cwd')

nnoremap <silent><buffer><expr> L defx#do_action('resize',
\ defx#get_context().winwidth + 10)
nnoremap <silent><buffer><expr> H defx#do_action('resize',
\ defx#get_context().winwidth - 10)

endfunction


call defx#custom#column('icon', {
      \ 'directory_icon': '▸ ',
      \ 'file_icon': '  ',
      \ 'opened_icon': '▾ ',
      \ 'root_icon': '  ',
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })




