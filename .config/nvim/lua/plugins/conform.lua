return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			svelte = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			c = { "clang-format" },
		},
		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_format = "fallback",
			timeout_ms = 500,
		},

		-- formatters = {
		-- 	clang_format = {
		-- 		prepend_args = { "--style=file", "--fallback-style=LLVM" },
		-- 	},
		-- 	shfmt = {
		-- 		prepend_args = { "-i", "4" },
		-- 	},
		-- },
	},
}
