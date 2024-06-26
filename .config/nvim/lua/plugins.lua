return {
    {'nvim-tree/nvim-web-devicons'},
    -- lsp and mason
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = "rafamadriz/friendly-snippets",
    },
    -- completions for all languages
    'saadparwaiz1/cmp_luasnip',

    -- --which key
    -- {
    --     "folke/which-key.nvim",
    --     event = "VeryLazy",
    --     init = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --     end,
    --     opts = {
    --         -- your configuration comes here
    --         -- or leave it empty to use the default settings
    --         -- refer to the configuration section below
    --     }
    -- },

    -- auto close parens
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- "sindrets/diffview.nvim",
    -- git 
    "tpope/vim-fugitive",
    "akinsho/git-conflict.nvim",

    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup({})
        end
    },


    -- surround tags
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function ()
            require("nvim-surround").setup({
                move_cursor = false
            })
        end
    },


    -- -- write as sudo
    --{
    --    "lambdalisue/vim-suda"
    --},


    -- -- Writing 
    -- markdown previews in browser
    { "preservim/vim-pencil", },

    -- -- WIP
    -- --notifications
    -- "rcarriga/nvim-notify",
    -- -- status line popups
    -- "j-hui/fidget.nvim",
}


