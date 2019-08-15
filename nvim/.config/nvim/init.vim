call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

colorscheme onedark

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

