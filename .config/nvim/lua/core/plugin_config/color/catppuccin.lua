require("catppuccin").setup {
    color_overrides = {
        latte = {},
        frappe = {},
        macchiato = {},
        mocha = {},
    },
    no_italic = true,
    highlight_overrides = {
        all = function(colors)
            return {
                Normal = { fg = colors.text, bg = colors.crust },
                NormalNC = { fg = colors.text, bg = colors.crust },
                NormalFloat = { fg = colors.text, bg = colors.crust },
                CursorLine = {bg = colors.mantle},
                LineNr = {fg = colors.surface0},
                NvimTreeNormal = {bg = colors.crust},
                NvimTreeWinSeparator = {fg = colors.base, bg = colors.crust},
                TelescopeBorder = {fg = colors.surface0},
                Comment = { style = {}},
                NonText = { style = {"bold"}},
                GhostText = { fg = colors.surface1}, -- completions color
                RustInlayHints = { fg = colors.surface0 }

            }
        end,
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
    },
}
vim.cmd.colorscheme "catppuccin-mocha"
