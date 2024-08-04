return {
	-- lsp and mason
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = "rafamadriz/friendly-snippets",
	},
	-- completions for all languages
	"saadparwaiz1/cmp_luasnip",

	-- auto close parens
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- "sindrets/diffview.nvim",
	-- git
	"tpope/vim-fugitive",
	"akinsho/git-conflict.nvim",

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	},

	-- surround tags
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				move_cursor = false,
			})
		end,
	},

	-- -- Writing
	-- markdown previews in browser
	{ "preservim/vim-pencil" },

	-- -- WIP
	-- --notifications
	-- "rcarriga/nvim-notify",
	-- -- status line popups
	-- "j-hui/fidget.nvim",
}
