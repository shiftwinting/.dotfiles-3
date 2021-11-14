-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd("set runtimepath^=~/.vim runtimepath+=/.vim/after")
vim.cmd("let &packpath = &runtimepath")

-- ----------------------
-- Themes

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

vim.api.nvim_buf_set_keymap("<buffer>", "n", "<F8>", ":lnext<CR>", { noremap = true })
vim.api.nvim_buf_set_keymap("<buffer>", "n", "<S-F8>", ":lprev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Z>", "<NOP>", { noremap = true })

-- Define custom command to update and upgrade in one go.
vim.cmd("command! PS PackerSync")

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
vim.cmd([[set listchars+=tab:<->]])

-- Make tabs spaces - required for neovim development
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable true colors.
vim.o.termguicolors = true

-- This disables the display of the matches while you are still typing your search.
vim.o.incsearch = false

vim.api.nvim_buf_set_keymap("<buffer>", "", "\\c", ":set formatoptions-=cro<Enter>", { noremap = true })

-- Set default font and font size for GUI.
vim.cmd([[set guifont=Fira\ Code:h20]])

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

on_attach = function(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

function lsp_clangd()
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer

	require("lspconfig").clangd.setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

function lsp_sumneko_lua()
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
			},
		},
	})
end

function lsp_pyright()
	require("lspconfig").pyright.setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

function lsp_yamlls()
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

lsp_clangd()
lsp_sumneko_lua()
lsp_pyright()
lsp_yamlls()
