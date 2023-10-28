require("catppuccin").setup {
    color_overrides = {
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {
            base = "#11111b",

        },
    }
}


vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin-mocha"
