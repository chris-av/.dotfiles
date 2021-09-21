syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set autoindent
set backspace=indent,eol,start
set encoding=UTF-8
set nowrap
set sidescroll=1

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

" key bindings for nerd tree
source ~/.vim/configs/nerdtree-bindings.vim

" modfiy pmenu colors
source ~/.vim/configs/pmenu-colors.vim

" custom status line
" source ~/.vim/configs/statusline.vim

" plugin settings
source ~/.vim/configs/neoclide-coc.vim
source ~/.vim/configs/alan-vim-closetag.vim

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''

