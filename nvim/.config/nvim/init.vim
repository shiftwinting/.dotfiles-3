call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'embear/vim-uncrustify'
Plug 'Konfekt/FastFold'

" tmux
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'tomasr/molokai'

call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"My own personal settings

colorscheme molokai

let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["tex"] }
let g:syntastic_always_populate_loc_list = 1

noremap <F3> :Uncrustify<CR>
noremap <F5> :Neomake<CR>
noremap <F8> :lnext<CR>
noremap <S-F8> :lprev<CR>
noremap <F9> :Make<CR>
noremap <C-n> :NERDTreeToggle<CR>

" Define custom command to update and upgrade in one go.
command! PU PlugUpdate | PlugUpgrade
command! PI PlugInstall
command! PC PlugClean!

let g:airline#extensions#tmuxline#enabled = 0

highlight Folded ctermfg=204
