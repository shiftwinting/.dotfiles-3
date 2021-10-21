call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'zplugin/zplugin-vim-syntax'
Plug 'farmergreg/vim-lastplace'

" Firenvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" tmux
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" LSP
Plug 'neovim/nvim-lspconfig'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'owozsh/amora'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'Badacadabra/vim-archery'
Plug 'mhartington/oceanic-next'
Plug 'bluz71/vim-moonfly-colors'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kyoz/purify', { 'rtp': 'vim' }

call plug#end()

set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"----------------------
"Colors

"colorscheme molokai
"highlight Folded ctermfg=204

"colorscheme badwolf

"colorscheme onehalfdark

"colorscheme synthwave
"highlight Folded ctermfg=204
"highlight Folded ctermbg=000

colorscheme dracula

"colorscheme purify

"colorscheme moonfly

"colorscheme amora

"colorscheme archery

"colorscheme OceanicNext

"------------------------------------
"Other settings

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

" Disable auto-comment for current session
map \c :set formatoptions-=cro

"------------------------------------
" Global marks

" Go to last python file
au FileType python normal! mP

" Go to last make file
au FileType make normal! mM

"------------------------------------
" Tree-sitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

"------------------------------------
" LSP

function! LSP()
lua << EOF
  local nvim_lsp = require('lspconfig')

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  local servers = { 'clangd' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
EOF
endfunction

call LSP()
