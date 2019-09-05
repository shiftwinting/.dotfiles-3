call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'

call plug#end()

"colorscheme onedark

set background=dark
colorscheme palenight
set termguicolors

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

