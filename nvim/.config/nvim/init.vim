call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'embear/vim-uncrustify'
Plug 'Konfekt/FastFold'
Plug 'zplugin/zplugin-vim-syntax'
Plug 'kalekundert/vim-coiled-snake'

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

set clipboard+=unnamedplus

"esc removes highlighed text
nnoremap <esc> :noh<return><esc>

set foldmethod=syntax
set foldopen-=block
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax
autocmd InsertEnter,WinLeave * setlocal foldmethod=manual
