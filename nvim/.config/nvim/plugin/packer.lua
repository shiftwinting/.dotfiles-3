local plugins = {
	"wbthomason/packer.nvim",

	-- General plugins
	"farmergreg/vim-lastplace",
	"tpope/vim-fugitive",

	-- Firenvim
	{
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	-- tmux
	"edkolev/tmuxline.vim",
	"christoomey/vim-tmux-navigator",

	-- Themes
	{
		"dracula/vim",
		as = "dracula",
	},
	{ "sonph/onehalf", rtp = "vim" },
	{ "kyoz/purify", rtp = "vim" },
	"owozsh/amora",
	"tomasr/molokai",
	"sjl/badwolf",
	"TroyFletcher/vim-colors-synthwave",
	"Badacadabra/vim-archery",
	"mhartington/oceanic-next",
	"bluz71/vim-moonfly-colors",

	-- LSP
	"neovim/nvim-lspconfig",
}

local config = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		keybindings = {
			quit = "<esc>",
		},
	},
}

require("packer").startup({ plugins, config = config })
