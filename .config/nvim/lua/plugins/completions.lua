return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 100,


    dependencies = {
        {"roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        -- "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    opts = function(_, opts)
        opts.formatting = {
            format = require("tailwindcss-colorizer-cmp").formatter,
        }
    end,
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        local cmp = require("cmp");
        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                -- { name = 'path' },
            }, {
                { name = 'buffer' },
            }),
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),

                -- Alt-L must have a selection, cannot auto select
                ['<M-l>'] = cmp.mapping.confirm({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),


                }),
                ["<M-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<M-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            experimental = {
                ghost_text = { hl_group = 'GhostText' }
            },

        })

        cmp.setup.filetype({"sql"}, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
            },
        })


        local twcc = require("tailwindcss-colorizer-cmp")
        twcc.setup({
            color_square_width = 5
        })
        cmp.config.formatting = {
            format = twcc.formatter
        }



        -- keymaps for jumping?
        local ls = require "luasnip"
        ls.config.set_config {
            history = false,
            updateevents = "TextChanged,TextChangedI",
        }

        -- custom snippets
        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end

        vim.keymap.set({ "i", "s" }, "<M-l>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<M-h>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
    end

}
