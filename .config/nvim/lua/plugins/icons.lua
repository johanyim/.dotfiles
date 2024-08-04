return {
	"nvim-tree/nvim-web-devicons",

	opt = {},
	config = function()
		require("nvim-web-devicons").setup({

			override_by_extension = {
				["gleam"] = {
					icon = "",
					color = "#ffaff3",
					name = "Gleam",
				},
			},
		})
	end,
}
