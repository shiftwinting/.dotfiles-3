call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'Chiel92/vim-autoformat'
Plug 'Konfekt/FastFold'
Plug 'zplugin/zplugin-vim-syntax'
Plug 'farmergreg/vim-lastplace'

" tmux
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'owozsh/amora'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'Badacadabra/vim-archery'
Plug 'mhartington/oceanic-next'

call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"----------------------
"Colors

"colorscheme molokai
"highlight Folded ctermfg=204

"colorscheme badwolf

"colorscheme synthwave
"highlight Folded ctermfg=204
"highlight Folded ctermbg=000

colorscheme dracula

"colorscheme amora

"colorscheme archery

"colorscheme OceanicNext

"------------------------------------
"Other settings

noremap <F3> :Autoformat<CR>
noremap <F8> :lnext<CR>
noremap <S-F8> :lprev<CR>
nnoremap <C-Z> <NOP>

" Define custom command to update and upgrade in one go.
command! PU PlugUpdate | PlugUpgrade
command! PI PlugInstall
command! PC PlugClean!

set clipboard+=unnamedplus

"esc removes highlighed text
nnoremap <esc> :noh<return><esc>

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


set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=-1

" Make a tab an actual tab.
"set noexpandtab

" Make tabs spaces - required for neovim development
set expandtab

set ignorecase
set smartcase

" Enable true colors.
set termguicolors

" This disables the display of the matches while you are still typing your
" search.
set noincsearch

" Insert only one space after a '.', '?' and '!' with a join command.
set nojoinspaces

"------------------------------------
" Treesitter config

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
