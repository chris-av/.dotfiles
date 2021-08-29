syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set autoindent
set backspace=indent,eol,start
set encoding=UTF-8
set statusline+=%=%f

" map F1 to escape
nmap <F1> <Esc>
imap <F1> <Esc>

set directory^=$HOME/.vim/tmp//

au FileType gitcommit setlocal tw=72

augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/index.'.expand("<afile>:e")
augroup END

" Define plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" key bindings for nerd tree
source ~/.vim/configs/nerdtree-bindings.vim
" let g:NERDTreeHighlightFolders = 1
" let g:NERDTreeHighlightFoldersFullName = 1
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Change NERDTree key bindings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-r> :redraw!<CR>

" modfiy pmenu colors
source ~/.vim/configs/pmenu-colors.vim

" plugin settings
source ~/.vim/configs/neoclide-coc.vim
source ~/.vim/configs/alan-vim-closetag.vim

