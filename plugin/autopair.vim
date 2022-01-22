function! Before_first_char_of_line()
    " https://devhints.io/vimscript-functions
    " https://vi.stackexchange.com/questions/6265/usage-of-the-operator
    let cur_mode = mode()
    if cur_mode == 'n'
        let pos_repair = 1
    else
        let pos_repair = 2
    endif

    let cursorpos = col('.') - pos_repair
    if cursorpos < 0
        " Cursor is at the head of line
        return 1
    endif
    let str_before_and_at_cursor = getline('.')[:cursorpos]
    return str_before_and_at_cursor =~ '^\s*$'
endfunction

let g:AutoPairsShortcutJump = '<M-n>'
"imap <expr> <TAB> Before_first_char_of_line() ? "<TAB>":"<M-n>"
"nmap <expr> <TAB> Before_first_char_of_line() ? "<TAB>":"<M-n>"
