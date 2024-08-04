return {
	"1riz/telescope-macros.nvim",
	config = function()
		require("telescope").load_extension("macros")

		vim.keymap.set("n", "<space>q", "<cmd>Telescope macros<cr>")
	end,
}
