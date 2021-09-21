" ================== syntax highlighting ==========================
"
"
" This is copied from the default setting of
" "jackguo380/vim-lsp-cxx-highlight/" (https://github.com/jackguo380/vim-lsp-cxx-highlight/blob/master/syntax/lsp_cxx_highlight.vim)
" ref: https://github.com/jackguo380/vim-lsp-cxx-highlight/issues/41
" 
"
"" Default syntax
" Customizing:
" to change the highlighting of a group add this to your vimrc.
"
" E.g. Change Preprocessor skipped regions to red bold text
" hi LspCxxHlSkippedRegion cterm=Red guifg=#FF0000 cterm=bold gui=bold
"
" E.g. Change Variables to be highlighted as Identifiers
" hi link LspCxxHlSymVariable Identifier

hi default MyComment guifg=#57A64A
hi default VSBlue guifg=#639EFF "#3C8CFF "#569cd6
hi default MyGreen guifg=#69EB65 "#5CEFD1 "#40ffff
hi default MyYellow guifg=#FFFF60 "#DCDCAA

hi! default link Type VSBlue 
hi! default link Function MyYellow 
hi! default link Operator MyYellow
hi! default link Comment MyComment

" Preprocessor Skipped Regions:
"
" This is used for false branches of #if or other preprocessor conditions
hi default link LspCxxHlSkippedRegion Comment

" This is the first and last line of the preprocessor regions
" in most cases this contains the #if/#else/#endif statements
" so it is better to let syntax do the highlighting.
hi default link LspCxxHlSkippedRegionBeginEnd Normal


" Syntax Highlighting:
"
" Custom Highlight Groups
if g:lsp_cxx_hl_light_bg
    hi default LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#573F54 cterm=none gui=none
    hi default LspCxxHlGroupNamespace ctermfg=Yellow guifg=#3D3D00 cterm=none gui=none
    hi default LspCxxHlGroupMemberVariable ctermfg=Black guifg=Black
else
    hi default LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#AD7FA8 cterm=none gui=none
    hi default LspCxxHlGroupNamespace ctermfg=Yellow guifg=#BBBB00 cterm=none gui=none
    hi default LspCxxHlGroupMemberVariable ctermfg=White guifg=White
endif

hi default link LspCxxHlSymUnknown Normal


" Type

" hi default link LspCxxHlSymClass Type
" hi default link LspCxxHlSymStruct Type
" hi default link LspCxxHlSymEnum Type
" hi default link LspCxxHlSymTypeAlias Type
" hi default link LspCxxHlSymTypeParameter Type

hi default link LspCxxHlSymClass MyGreen
hi default link LspCxxHlSymStruct MyGreen
hi default link LspCxxHlSymEnum MyGreen
hi default link LspCxxHlSymTypeAlias VSBlue
hi default link LspCxxHlSymTypeParameter VSBlue
hi default link LspCxxHlSymDependentType VSBlue




" Function
hi default link LspCxxHlSymFunction Function
hi default link LspCxxHlSymMethod Function
hi default link LspCxxHlSymStaticMethod Function
hi default link LspCxxHlSymConstructor Function

" EnumConstant
hi default link LspCxxHlSymEnumMember LspCxxHlGroupEnumConstant

" Preprocessor
hi default link LspCxxHlSymMacro Macro

" Namespace
hi default link LspCxxHlSymNamespace LspCxxHlGroupNamespace

" Variables
hi default link LspCxxHlSymVariable Normal
hi default link LspCxxHlSymParameter Normal
hi default link LspCxxHlSymField LspCxxHlGroupMemberVariable

" clangd-only groups
" A static member variable
hi default link LspCxxHlSymUnknownStaticField Normal
" Seems to be when a type alias refers to a primitive
hi default link LspCxxHlSymPrimitive Type
" Equivalent to TypeAlias
hi default link LspCxxHlSymTypedef Type
" Equivalent to TypeParameter
hi default link LspCxxHlSymTemplateParameter Type
" Equivalent to EnumMember
hi default link LspCxxHlSymEnumConstant LspCxxHlGroupEnumConstant
" A type dependent on a template
" E.g. T::A, A would be a dependent type
hi default link LspCxxHlSymDependentType Type
" A name dependent on a template, usually a function but can also be a variable?
hi default link LspCxxHlSymDependentName Function
" C++20 concepts, maybe type is sufficient for now...
hi default link LspCxxHlSymConcept Type
