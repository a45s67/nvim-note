" ===== init =====
" set path+=**

" split
set splitbelow
set splitright

" navigate around splits
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l
nnoremap <A-h> <C-W>h

" tab space
" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
"
    filetype plugin indent on
    " show existing tab with 4 spaces width
    set tabstop=4
    " when indenting with '>', use 4 spaces width
    set shiftwidth=4
    " On pressing tab, insert 4 spaces
    set expandtab



" Ctags
nnoremap <C-[> <C-T>

" ===== Plugin =====
call plug#begin('~/.vim/plugged')

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'easymotion/vim-easymotion'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


"    Plug 'kyazdani42/nvim-web-devicons' " for file icons
"    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " To activate coc on c++, you must install ccl first



    
    Plug 'neovim/nvim-lspconfig'
    Plug 'preservim/tagbar' 


call plug#end()


" ======= easy motion ======
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" xxxxxx easy motion end xxxxxxx
" ======= tagbar ======
nnoremap <F8> :TagbarToggle<CR>

" ======= fzf ======
nnoremap <F3> :FZF<CR>

" ======= airline ====
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

" ======== pane =====
" modify from https://www.reddit.com/r/vim/comments/effwku/transparent_vertical_bar_in_vim/
" https://stackoverflow.com/questions/9001337/vim-split-bar-styling
" instead of cterm, we must use "gui" in windowsternimal
set fillchars+=vert:\|
hi VertSplit guifg=Blue guibg=NONE gui=NONE
