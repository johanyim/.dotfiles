return {
	-- null-ls is unmaintained
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",

	opts = {},
	config = function()
		local null_ls = require("null-ls")
	end,
}
