return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")

		elixir.setup({
			nextls = {
				enable = true, -- defaults to false
				-- port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
				-- cmd = "path/to/next-ls", -- path to the executable. mutually exclusive with `port`
				-- init_options = {
				-- 	mix_env = "dev",
				-- 	mix_target = "host",
				-- 	experimental = {
				-- 		completions = {
				-- 			enable = false, -- control if completions are enabled. defaults to false
				-- 		},
				-- 	},
				-- },
				-- on_attach = function(client, bufnr)
				-- 	-- custom keybinds
				-- end,
			},
			elixirls = {
				cmd = "/usr/bin/elixir-ls",
				enable = true,
				settings = elixirls.settings({
					dialyzerEnabled = false,
					enableTestLenses = false,
				}),
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
					vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
					vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
				end,
			},
			projectionist = {
				enable = true,
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
