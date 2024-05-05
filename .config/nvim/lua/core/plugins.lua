local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "catppuccin/nvim",
    -- 'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-nreesitter/playground',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'arkav/lualine-lsp-progress' }
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        'stevearc/aerial.nvim',
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
    {"akinsho/toggleterm.nvim"},

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
    {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },

    -- compiler explorer
    'p00f/godbolt.nvim',


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

    {
        "vimwiki/vimwiki",
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



    -- may need to tidy this up later
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "scala", "sbt", "java" },
        opts = function()
            local metals_config = require("metals").bare_config()
            metals_config.on_attach = function(client, bufnr)
                -- your on_attach function
            end

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end
    }






    -- -- WIP
    -- --notifications
    -- "rcarriga/nvim-notify",
    -- -- status line popups
    -- "j-hui/fidget.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
