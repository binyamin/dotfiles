" plugins
call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tpope/vim-commentary'

call plug#end()

syntax on

set number
set encoding=utf-8
set title
set shell=zsh

noremap <leader>/ :Commentary<cr>

let g:neodark#terminal_transparent = 1

colorscheme neodark
