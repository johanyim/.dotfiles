return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"prettierd",
					"tailwindcss-language-server",
					"svelte-language-server",
					"stylua",
					"eslint-lsp",
					"pyright",
					"tinymist",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					-- "rust_analyzer",
					"bashls",
					"gopls",
					"clangd",
					"ruff",
					"html",
					"cssls",
					"jsonls",
					"ts_ls",
					"emmet_ls",
					"astro",
					"elixirls",
					"marksman",
					"yamlls",
					"asm_lsp",
				},
			})

			-- require("mason-lspconfig").setup_handlers({
			--     ["rust_analyzer"] = function () end -- rust analyzer is handled by rustaceanvim
			-- })
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig/util")

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						hint = { enable = true },
					},
				},
			})

			-- lspconfig.rust_analyzer.setup {
			--     on_attach = on_attach,
			--     capabilities = capabilities,
			--     filetypes = { "rust" },
			--     root_dir = util.root_pattern("Cargo.toml"),
			--     settings = {
			--         ['rust-analyzer'] = {
			--             cargo = {
			--                 allFeatures = true,
			--             },
			--         },
			--     },
			-- }
			lspconfig.marksman.setup({
				filetypes = { "markdown" },
				capabilities = capabilities,
			})

			lspconfig.bashls.setup({
				filetypes = { "bash", "zsh", "sh" },
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				gmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
					"astro",
				},
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
					"astro",
				},
			})
			lspconfig.html.setup({
				filetypes = { "html", "php", "blade", "svelte" },
				capabilities = capabilities,
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
					"astro",
				},
			})

			lspconfig.pyright.setup({
				filetypes = { "python" },
				capabilities = capabilities,
			})

			lspconfig.ruff.setup({
				filetypes = { "python" },
				capabilities = capabilities,
			})

			lspconfig.astro.setup({
				filetypes = { "astro" },
				capabilities = capabilities,
			})

			lspconfig.svelte.setup({
				cmd = { "svelteserver", "--stdio" },
				filetypes = { "svelte" },
				capabilities = capabilities,
				-- root_dir = root_pattern("package.json", ".git"),
			})

			lspconfig.gleam.setup({
				filetypes = { "gleam" },
				capabilities = capabilities,
			})

			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
				filetypes = { "elixir" },
				capabilities = capabilities,
			})

			lspconfig.yamlls.setup({
				filetypes = { "yaml", "yml" },
				settings = {
					yaml = {
						format = {
							enable = true,
						},
						validate = true,
						schemaStore = {
							enable = false,
							url = "",
						},
					},
				},
				capabilities = capabilities,
			})

			lspconfig.tinymist.setup({
				-- cmd = { "tinymist" },
				-- filetypes = { "typst", "typ" },
				capabilities = capabilities,
			})
			--
			-- lspconfig.nextls.setup({
			-- 	filetypes = { "elixir" },
			-- 	capabilities = capabilities,
			-- })

			lspconfig.asm_lsp.setup({
				filetypes = { "asm" },
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		end,
	},
}
