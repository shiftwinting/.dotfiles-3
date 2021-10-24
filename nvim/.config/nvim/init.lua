vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')
]])

-- General plugins

vim.cmd([[
Plug 'zplugin/zplugin-vim-syntax'
Plug 'farmergreg/vim-lastplace'
]])

-- Firenvim
vim.cmd([[
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
]])

-- tmux
vim.cmd([[ 
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
]])

-- Tree-sitter
vim.cmd([[
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
]])

-- LSP
vim.cmd([[
Plug 'neovim/nvim-lspconfig'
]])

-- Themes
vim.cmd([[ 
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
]])

vim.cmd([[
call plug#end()
]])

vim.cmd([[ 
set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- ----------------------
-- Colors

vim.cmd([[ 
"colorscheme molokai
"highlight Folded ctermfg=204
]])

-- vim.cmd("colorscheme badwolf")
-- vim.cmd("colorscheme onehalfdark")
-- vim.cmd("colorscheme purify")
-- vim.cmd("colorscheme moonfly")
-- vim.cmd("colorscheme amora")
-- vim.cmd("colorscheme archery")
-- vim.cmd("colorscheme OceanicNext")

vim.cmd([[ 
"colorscheme synthwave
"highlight Folded ctermfg=204
"highlight Folded ctermbg=000
]])

vim.cmd("colorscheme dracula")

-- ------------------------------------
-- Other settings

vim.cmd("noremap <F8> :lnext<CR>")
vim.cmd("noremap <S-F8> :lprev<CR>")
vim.cmd("nnoremap <C-Z> <NOP>")

-- Define custom command to update and upgrade in one go.
vim.cmd("command! PU PlugUpdate | PlugUpgrade")
vim.cmd("command! PI PlugInstall")
vim.cmd("command! PC PlugClean!")

vim.cmd("set clipboard+=unnamedplus")

-- esc removes highlighed text
vim.cmd("nnoremap <esc> :noh<return><esc>")

vim.cmd([[ 
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
]])

vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = -1

-- Make tabs spaces - required for neovim development
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable true colors.
vim.o.termguicolors = true

-- This disables the display of the matches while you are still typing your search.
vim.o.incsearch = false

-- Disable auto-comment for current session
vim.cmd([[
map \c :set formatoptions-=cro
]])

------------------------------------
-- Global marks

-- Go to last python file
vim.cmd("au FileType python normal! mP")

-- Go to last make file
vim.cmd("au FileType make normal! mM")

------------------------------------
-- Treesitter

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
})

------------------------------------
-- LSP

function lsp_clangd()
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, "n", ...)
		end
		local opts = { noremap = true, silent = true }
		buf_set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		buf_set_keymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		buf_set_keymap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
		buf_set_keymap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	end

	require("lspconfig").clangd.setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

function lsp_sumneko_lua()
	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, "n", ...)
		end
		local opts = { noremap = true, silent = true }
		buf_set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		buf_set_keymap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		buf_set_keymap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
		buf_set_keymap("<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	end

	local sumneko_root_path = "/usr/lib/lua-language-server"
	local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
	local data_path = os.getenv("XDG_DATA_HOME")

	-- Make runtime files discoverable to the server
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	require("lspconfig").sumneko_lua.setup({
		cmd = {
			sumneko_binary,
			"-E",
			sumneko_root_path .. "/main.lua",
			"--logpath=" .. data_path .. "/log",
			"--metapath=" .. data_path .. "/meta",
		},
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {
						-- neovim
						"vim",
						"capabilities",
						-- busted
						"after_each",
						"before_each",
						"context",
						"describe",
						"it",
						"setup",
						"teardown",
						"pending",
					},
					disable = { "lowercase-global" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					maxPreload = 1000,
					preloadFileSize = 350,
					checkThirdParty = false,
				},
				completion = { callSnippet = "Replace", showWord = "Disable" },
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

lsp_clangd()
lsp_sumneko_lua()
