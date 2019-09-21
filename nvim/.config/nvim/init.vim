call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/nerdtree'
Plug 'edkolev/tmuxline.vim'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"My own personal settings

set background=dark
colorscheme palenight
set termguicolors

let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["tex"] }
let g:syntastic_always_populate_loc_list = 1

noremap <F3> :Autoformat<CR>
noremap <F8> :lnext<CR>
noremap <S-F8> :lprev<CR>
noremap <F9> :Make!<CR>
map <C-n> :NERDTreeToggle<CR>
