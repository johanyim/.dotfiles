return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",

	config = function()
		local lines = require("lsp_lines")
		lines.setup({})

		local diagnostics_active = true
		vim.diagnostic.config({
			virtual_lines = false,
			virtual_text = true,
		})

		vim.keymap.set("n", "<leader>d", function()
			if diagnostics_active then
				vim.diagnostic.config({
					virtual_text = false,
					virtual_lines = true,
				})
			else
				vim.diagnostic.config({
					virtual_text = true,
					virtual_lines = false,
				})
			end
			diagnostics_active = not diagnostics_active
		end)
	end,
}
