local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "catppuccin/nvim", as = "catppuccin" },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- TreeSitter
    'nvim-treesitter/nvim-treesitter',

    -- lualine and lsp progress integration
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'arkav/lualine-lsp-progress'
            -- 'nvim-tree/nvim-web-devicons',
            -- 'linrongbin16/lsp-progress.nvim',
        }
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },


    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- lsp and mason
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    -- completions
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {"roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        },
        opts = function(_, opts)
            opts.formatting = {
                format = require("tailwindcss-colorizer-cmp").formatter,
            }
        end,
    },
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {"python"},
    },


    -- lua snip
    {
	    "L3MON4D3/LuaSnip",
	    version = "v2.*",
	    build = "make install_jsregexp"
    },


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

    -- tmux-vim integration
    'alexghergh/nvim-tmux-navigation',

    -- harpoon 
    { "ThePrimeagen/harpoon" },

    -- completions for all languages
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    -- terminal
    {"akinsho/toggleterm.nvim", version = '*'},

    -- "sindrets/diffview.nvim",
    -- git 
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "akinsho/git-conflict.nvim",


    -- commenting
    'numToStr/Comment.nvim',

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    -- todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- -- rainbow parentheses
    -- {
    --     "HiPhish/nvim-ts-rainbow2",
    --     dependencies = { "nvim-treesitter/nvim-treesitter" },

    -- rust tools
    'simrat39/rust-tools.nvim',
    { 'saecki/crates.nvim', tag = 'v0.4.0', },

    -- rgba colors 
    'NvChad/nvim-colorizer.lua',

    -- surround tags
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
    },




    {
        "aurum77/live-server.nvim",
        build = function()
            require"live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    },

    --vimtex 
    {
        "lervag/vimtex",
    },

    -- lsp diagnostic lines
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        -- config = function()
        --     require("lines").setup()
        -- end,
    },

    -- -- Writing 
    -- markdown previews in browser
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown", -- or 'event = "VeryLazy"'
        opts = {
            -- configuration here or empty for defaults
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "folke/zen-mode.nvim", },
    { "preservim/vim-pencil", },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },

    'nvim-treesitter/playground',







    -- -- WIP
    -- --notifications
    -- "rcarriga/nvim-notify",
    -- -- status line popups
    -- "j-hui/fidget.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
