return {
    "jellydn/hurl.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    ft = "hurl",
    opts = {
        debug = true, -- If true, logs will be saved at ~/.local/state/nvim/hurl.nvim.log
        mode = 'split',
        split_position = "right",
        split_size = "50%",
        popup_position = '50%',
        -- popup_size = {
        --     width = 80,
        --     height = 40,
        -- },

        -- Default environment file name
        env_file = {
            'vars.env',
        },
        -- Default formatter
        formatters = {
            json = { 'jq' },
            html = {
                'prettier',
                '--parser',
                'html',
            },
        },
    },
    keys = {
        -- Run API request
        { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
        { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
        { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
        { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
        { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
        -- Run Hurl request in visual mode
        { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
    },
}
