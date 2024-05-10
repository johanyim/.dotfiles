return {
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
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            {
                "lvimuser/lsp-inlayhints.nvim",
                opts = {}
            },
        },
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                inlay_hints = {
                    highlight = "LspInlayHint",
                    auto = false,
                },
                tools = {
                    hover_actions = {
                        auto_focus = false,
                    },
                },
                server = {
                    on_attach = function(client, bufnr)
                        require("lsp-inlayhints").on_attach(client, bufnr)
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {
                        },
                    },
                },
            }
        end
    },
    'saecki/crates.nvim',
}
