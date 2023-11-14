local colors = require("catppuccin.palettes").get_palette("mocha")

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = {
                a = {fg = colors.blue, bg = colors.crust},
                b = {fg = colors.mauve, bg = colors.crust},
                c = {fg = colors.surface0, bg = colors.crust},
                x = {fg = colors.surface0, bg = colors.crust},
                y = {fg = colors.surface1, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},
            },
            insert = {
                a = {fg = colors.green, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
            visual = {
                a = {fg = colors.mauve, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
            command = {
                a = {fg = colors.peach, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
            replace = {
                a = {fg = colors.red, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
        },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
}
