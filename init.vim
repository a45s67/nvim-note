" ===== init =====
" :help terminal-emulator
tnoremap <Esc> <C-\><C-n>
" set path+=**

" set clipboard shared with other nvim process
" set clipboard=unnamedplus
" set file encoding
" ref: https://ppt.cc/PMkV
set fileencodings=utf8,big5
set fileencoding=utf8
" set termencoding=utf8
" let &termencoding = &encoding
set encoding=utf-8

" split
set splitbelow
set splitright

" navigate around splits
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l
nnoremap <A-h> <C-W>h
nnoremap <space>p <C-W>p
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
    "
    " Plug 'mhinz/vim-startify'
    " For project
    Plug 'ilyachur/cmake4vim'

    " For edit
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    " For formatting
    Plug 'rhysd/vim-clang-format'
    Plug 'Chiel92/vim-autoformat'

    " git integrate
    Plug 'tpope/vim-fugitive'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

"    Plug 'vim-airline/vim-airline'
"    Plug 'vim-airline/vim-airline-themes'

    " Symbol tree
    Plug 'liuchengxu/vista.vim'
    " Status line
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kdheepak/tabline.nvim'
"   Plug 'Mofiqul/vscode.nvim'

"    Plug 'kyazdani42/nvim-web-devicons' " for file icons
"    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-git'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " For c++ syntax highlighting
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " To check current color group
    " Plug 'nvim-treesitter/playground'
    " To activate coc on c++, you must install ccl first
    
    " I turned to clangd now which uses the new semantic token protocal the
    " plugin is not supporting. So I turned it off. 
    " Plug 'jackguo380/vim-lsp-cxx-highlight'
    " Python syntax parser. It would be used in my coc setting
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
    " Python syntax highlighting
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

    " Global syntax highlighting
    Plug 'ray-x/aurora'
    Plug 'yashguptaz/calvera-dark.nvim'
    Plug 'savq/melange'
    Plug 'marko-cerovac/material.nvim'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'fenetikm/falcon'

    " log highlight
    Plug 'mtdl9/vim-log-highlighting'
    
    Plug 'neovim/nvim-lspconfig'
    Plug 'preservim/tagbar' 

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
    Plug 'junegunn/vim-easy-align'

    Plug 'junegunn/goyo.vim'

    " Ansi terminal color code reslover
    Plug 'powerman/vim-plugin-AnsiEsc'

    " tmux integration
    if !has('win64')
        Plug 'preservim/vimux'
    endif

    " Debugger
    Plug 'puremourning/vimspector'

call plug#end()


" Color scheme
colorscheme kanagawa
hi Normal guibg=NONE ctermbg=NONE

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
nnoremap <C-p> :FZF<CR>

" ======= LF =======
let lfvim = "go/pkg/mod/github.com/gokcehan/lf@v0.0.0-20211009210101-1b71c33afd1a/etc/lf.vim"
if filereadable(lfvim)
    exec "source " . lfvim
endif

" ======= airline ====
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

" ======== pane =====
" modify from https://www.reddit.com/r/vim/comments/effwku/transparent_vertical_bar_in_vim/
" https://stackoverflow.com/questions/9001337/vim-split-bar-styling
" instead of cterm, we must use "gui" in windowsternimal
set termguicolors " this variable must be enabled for colors to be applied properly
set fillchars+=vert:\|
hi VertSplit guifg=Blue guibg=NONE gui=NONE
" ======== popup =====
" https://vi.stackexchange.com/questions/23328/change-color-of-coc-suggestion-box
" https://vi.stackexchange.com/questions/12664/is-there-any-way-to-change-the-popup-menu-color
set pumblend=15 " :h 'pumblend' for more infomation.
hi PmenuSel blend=0 guibg=#e6db74 guifg=#232526
hi Pmenu guibg=#465457

" ======== set autopair keybinding at end ==========
imap <expr> <TAB> Before_first_char_of_line() ? "<TAB>":"<M-n>"
imap <silent><expr> <TAB>
      \ pumvisible() ? "<C-n>" :
      \ Before_first_char_of_line() ?
      \ "\<TAB>" : "\<M-n>"
