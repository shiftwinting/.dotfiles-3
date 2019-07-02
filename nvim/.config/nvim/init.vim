call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidgranstrom/nvim-markdown-preview'


call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
