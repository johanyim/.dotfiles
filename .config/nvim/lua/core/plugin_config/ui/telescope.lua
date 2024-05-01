local telescope = require('telescope')

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },

        prompt_prefix = " ",
        selection_caret = " ",
        color_devicons = true,
        layout_strategy = 'vertical',
        sorting_strategy = "descending",
        layout_config = {
            vertical = {
                height = 0.95,
                preview_cutoff = 10,
                prompt_position = "bottom",
                width = 0.9,
            }
        },
        results_title = "",
        prompt_title = "",

        -- using custom temp multi-select maps
        -- https://github.com/nvim-telescope/telescope.nvim/issues/1048
        dynamic_preview_title = true,
        winblend = 5, -- pseudo transparency
        wrap_results = 0,
        scroll_strategy = "limit",
        multi_icon = '+',
        borderchars = {'━','┃','━','┃','┏','┓','┛','┗'}, -- slick telescope layout
    },

    pickers = {
        find_files = {
            prompt_title = "find_files",
            results_title = "Current directory",
            hidden = true,
        },
        oldfiles = {
            prompt_title = "oldfiles",
            results_title = "History",
            hidden = true,
        },
    },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space>p', builtin.find_files, {})

vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>o', builtin.oldfiles, {})
-- vim.keymap.set('n', '<CR>', builtin.find_files, {})
-- vim.keymap.set('n', '<C-CR>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>g', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>t', builtin.highlights, {})
vim.keymap.set('n', '<Space>t', builtin.highlights, {})
vim.keymap.set('n', '<Space>d', builtin.diagnostics, {})
vim.keymap.set('n', '<Space>k', builtin.keymaps, {})


