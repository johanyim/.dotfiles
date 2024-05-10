return {
    "catppuccin/nvim",
    lazy = false,
    priority = 100,
    config = function ()
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
                        Comment = { style = {} },
                        NonText = { style = {"bold"}},

                        DiagnosticVirtualTextError = { fg = colors.red },
                        DiagnosticVirtualTextWarning = { fg = colors.yellow},
                        DiagnosticVirtualTextInfo = { fg = colors.sapphire},
                        DiagnosticVirtualTextHint = { fg = colors.teal },

                        GhostText = { fg = colors.surface1}, -- completions color
                        LspInlayHint = { fg = colors.surface0, bg = colors.none },

                    }
                end,
            },
            integrations = {
                cmp = true,
                treesitter = true,
            },
        }
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}

