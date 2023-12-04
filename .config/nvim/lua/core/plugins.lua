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

    -- lsp and mason
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    -- completions for lua
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- lua snip
    {
	    "L3MON4D3/LuaSnip",
	    version = "v2.*",
	    build = "make install_jsregexp"
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

    -- commenting
    'numToStr/Comment.nvim',

    -- rust tools
    'simrat39/rust-tools.nvim',
    { 'saecki/crates.nvim', tag = 'v0.4.0', },

    -- rgba colors 
    'norcalli/nvim-colorizer.lua',

    -- surround tags
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
    },

    -- markdown previews in browser
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- live server 
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

    -- -- WIP
    -- --notifications
    -- "rcarriga/nvim-notify",
    -- -- status line popups
    -- "j-hui/fidget.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
