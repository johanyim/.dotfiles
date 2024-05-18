return {
    {
        'simrat39/rust-tools.nvim',
        config = function ()
            local rt = require("rust-tools")

            rt.setup({
                tools = {
                    inlay_hints = {
                        auto = true,
                        only_current_line = false,
                        show_parameter_hints = true,
                        parameter_hints_prefix = "<= ",
                        other_hints_prefix = "-> ",
                        max_len_align = false,
                        max_len_align_padding = 1,
                        right_align = false,
                        right_align_padding = 3,
                        highlight = "LspInlayHint",
                    },
                    hover_actions = {
                        border = {
                            { "┏", "FloatBorder" },
                            { "━", "FloatBorder" },
                            { "┓", "FloatBorder" },
                            { "┃", "FloatBorder" },
                            { "┛", "FloatBorder" },
                            { "━", "FloatBorder" },
                            { "┗", "FloatBorder" },
                            { "┃", "FloatBorder" },
                        },
                        auto_focus = false,
                    },
                },
                server = {
                    on_attach = function(_, bufnr)
                        -- Info and documentation + Hover actions
                        -- vim.lsp.inlay_hint.enable(false)
                    end,
                },
            })
            rt.inlay_hints.enable()

        end
    },
    {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        'vxpm/ferris.nvim',
        ft = { "rust" },
        opts = {
            -- your options here
        }
    },

    'saecki/crates.nvim',
}
