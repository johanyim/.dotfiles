return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "rust", "lua", "python", "vim", "markdown" },
			highlight = {
				enable = true,
				-- additional_vim_regex_highlighting = false
			},
			indent = { enable = true },
			sync_install = true,
			auto_install = true,
		})

		vim.keymap.set("n", "gt", function()
			local result = vim.treesitter.get_captures_at_cursor(0)
			print(vim.inspect(result))
		end, { noremap = true, silent = false })
	end,
}
-- 'nvim-tree/nvim-tree.lua',
-- 'nvim-treesitter/playground',
