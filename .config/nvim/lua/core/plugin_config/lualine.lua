local colors = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
    text = "#cdd6f4",
    subtext1 = "#bac2de",
    subtext0 = "#a6adc8",
    overlay2 = "#9399b2",
    overlay1 = "#7f849c",
    overlay0 = "#6c7086",
    surface2 = "#585b70",
    surface1 = "#45475a",
    surface0 = "#313244",
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b",
}
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
