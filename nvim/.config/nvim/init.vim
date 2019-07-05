call plug#begin('~/.local/share/nvim/plugged')


call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
