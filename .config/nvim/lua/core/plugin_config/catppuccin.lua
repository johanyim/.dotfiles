require("catppuccin").setup {
    color_overrides = {
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {},
    },
    custom_highlights = function(colors)
			return {
                Normal = { fg = colors.text, bg = colors.crust },
				NormalNC = { fg = colors.text, bg = colors.crust },
				NormalFloat = { fg = colors.text, bg = colors.crust },
                CursorLine = {bg = colors.mantle},
                LineNr = {fg = colors.surface0},
                NvimTreeNormal = {bg = colors.crust},
                NvimTreeWinSeparator = {fg = colors.base, bg = colors.crust},
                

			}
		end,
    cmp = true,
    nvimtree = true,
    treesitter = true,
}
-- vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin-mocha"
