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
    'nvim-lualine/lualine.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    --completions for lua
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    {
	    "L3MON4D3/LuaSnip",
	    version = "v2.*",
	    build = "make install_jsregexp"
    },

    -- completions for all languages
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    -- terminal
    {"akinsho/toggleterm.nvim", version = '*'},

    -- commenting
    'numToStr/Comment.nvim',

    -- rust tools
    'simrat39/rust-tools.nvim',

    -- rgba colors 
    'norcalli/nvim-colorizer.lua',

    -- surround tags
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
    },

    --move blocks
    'fedepujol/move.nvim',

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

    -- lsp diagnostic lines
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        -- config = function()
        --     require("lines").setup()
        -- end,
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
