return {
    "folke/trouble.nvim",
    event = "VeryLazy",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        auto_close = false, -- auto close when there are no items
        auto_open = false, -- auto open when there are items
        auto_preview = true, -- automatically open preview when on an item
        auto_refresh = true, -- auto refresh when open
        auto_jump = false, -- auto jump to the item when there's only one
        focus = true, -- Focus the window when opened
        restore = true, -- restores the last location in the list when opening
        follow = true, -- Follow the current item
        indent_guides = true, -- show indent guides
        max_items = 200, -- limit number of items that can be displayed per section
        multiline = true, -- render multi-line messages
        pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
        warn_no_results = false, -- show a warning when there are no results
        open_no_results = true, -- open the trouble window when there are no results

        -- // leader+D 
        win = {
            position = "right",
            type = "split",
            size = 0.3,
        },

        modes = {
            diagnostics = {
                groups = {
                    {"severity", format="{severity} {count}"}
                },

                format = "{severity_icon} {file_icon}{filename}: {message:md} {pos:1} {code}",

            },
        },

    },
    keys = {
        { "<leader>D", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (trouble)"},
    },
}

