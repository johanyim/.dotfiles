return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        {"roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
        opts.formatting = {
            format = require("tailwindcss-colorizer-cmp").formatter,
        }
    end,
    config = function()
        local cmp = require("cmp");
        require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<A-l>'] = cmp.mapping.confirm({ select = true }),
                ["<A-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<A-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                    { name = 'buffer' },
                }),
            experimental = {
                ghost_text = { hl_group = 'GhostText' }
            },

        })
        local twcc = require("tailwindcss-colorizer-cmp")

        twcc.setup({
            color_square_width = 5
        })

        cmp.config.formatting = {
            format = twcc.formatter
        }

    end 

}