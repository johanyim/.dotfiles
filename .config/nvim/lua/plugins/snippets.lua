local snippet_dir = os.getenv("XDG_DATA_HOME") .. "/nvim/snippets"

return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	priority = 100,

	dependencies = {
		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"saadparwaiz1/cmp_luasnip",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{
			"chrisgrieser/nvim-scissors",
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"garymjr/nvim-snippets",
			},
		},
	},

	opts = function(_, opts)
		opts.formatting = {
			format = require("tailwindcss-colorizer-cmp").formatter,
		}
	end,

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = { snippet_dir },
		})
		local cmp = require("cmp")
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),

				-- Alt-L must have a selection, cannot auto select
				["<M-l>"] = cmp.mapping.confirm({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<M-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			experimental = {
				ghost_text = { hl_group = "GhostText" },
			},
		})

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})

		local twcc = require("tailwindcss-colorizer-cmp")
		twcc.setup({
			color_square_width = 5,
		})
		cmp.config.formatting = {
			format = twcc.formatter,
		}

		-- keymaps for jumping?
		local ls = require("luasnip")
		ls.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
		})

		-- custom snippets
		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
			loadfile(ft_path)()
		end

		vim.keymap.set({ "i", "s" }, "<M-l>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<M-h>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		vim.keymap.set("n", "<leader>se", function()
			require("scissors").editSnippet()
		end)

		-- when used in visual mode, prefills the selection as snippet body
		vim.keymap.set({ "n", "x" }, "<leader>sa", function()
			require("scissors").addNewSnippet()
		end)

		-- default settings
		require("scissors").setup({
			snippetDir = snippet_dir,
			editSnippetPopup = {
				height = 0.4, -- relative to the editor, number between 0 and 1
				width = 0.6,
				border = "rounded",
				keymaps = {
					cancel = "q",
					saveChanges = "<CR>", -- alternatively, can also use `:w`
					goBackToSearch = "<BS>",
					deleteSnippet = "<C-BS>",
					duplicateSnippet = "<C-d>",
					openInFile = "<C-o>",
					insertNextPlaceholder = "<C-p>", -- insert & normal mode
				},
			},

			backdrop = {
				enabled = true,
				blend = 50, -- between 0-100
			},
			telescope = {
				-- By default, the query only searches snippet prefixes. Set this to
				-- `true` to also search the body of the snippets.
				alsoSearchSnippetBody = false,
			},
			-- `none` writes as a minified json file using `vim.encode.json`.
			-- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
			-- you version control your snippets.
			jsonFormatter = "none", -- "yq"|"jq"|"none"
		})
	end,
}
