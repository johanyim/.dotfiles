local colors = require("catppuccin.palettes").get_palette("mocha")
require('nvim-treesitter.configs').setup {
    rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        -- disable = { 'jsx', 'cpp' },
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once vs highlight only part
        strategy = require('ts-rainbow').strategy.global,
        -- strategy = require('ts-rainbow').strategy.local,

        hlgroups = {
            'TSRainbowRed',
            'TSRainbowYellow',
            'TSRainbowBlue',
            'TSRainbowOrange',
            'TSRainbowGreen',
            'TSRainbowViolet',
            'TSRainbowCyan'
        },
    };

    vim.api.nvim_set_hl(0, "TSRainbowRed", { fg=colors.red});
    vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg=colors.yellow});
    vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg=colors.blue});
    vim.api.nvim_set_hl(0, "TSRainbowGreen", { fg=colors.green});
    vim.api.nvim_set_hl(0, "TSRainbowOrange", { fg=colors.peach});
    vim.api.nvim_set_hl(0, "TSRainbowViolet", { fg=colors.mauve});
    vim.api.nvim_set_hl(0, "TSRainbowCyan", { fg=colors.sky});
}





