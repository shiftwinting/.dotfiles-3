call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-dispatch'

call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"My own personal settings
set background=dark
colorscheme palenight
set termguicolors

noremap <F3> :Autoformat<CR>
noremap <F9> :Make!<CR>

let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["tex"] }
