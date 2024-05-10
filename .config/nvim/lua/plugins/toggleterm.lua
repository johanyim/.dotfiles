return {
    "akinsho/toggleterm.nvim",
    config = function ()
        local colors = require("catppuccin.palettes").get_palette("mocha")

        require('toggleterm').setup {
            size = 10,
            direction = "float",
            highlights = {
                NormalNC = {
                    -- guibg = color.green,
                },
                NormalFloat = {
                    link = 'Normal'
                },
                FloatBorder = {
                    guifg = colors.surface0,
                    -- guibg = color.blue,
                },
            },
            float_opts = {
                border = 'double',
            }
        }

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        local Terminal  = require('toggleterm.terminal').Terminal
        local gitui = Terminal:new({ cmd = "gitui -t mocha.ron", hidden = true })

        function Gitui_toggle()
            gitui:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Gitui_toggle()<CR>", {noremap = true, silent = true})

    end
}
