return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        require("aerial").setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            backends = { "treesitter", "lsp", "markdown", "man" },
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "gp", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "gn", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
            layout = {
                max_width = { 40, 0.2 },
                width = nil,
                min_width = { 10, 0.2 },
                default_direction = "prefer_right",
                placement = "edge",
                resize_to_content = true,
                preserve_equality = false,
            },
            attach_mode = "window",

            filter_kind = false,

            autojump = true,

            manage_folds = true,

            close_on_select = true,

            ghow_guides = true,
            guides = {
                -- When the child item has a sibling below it
                mid_item = "├─",
                -- When the child item is the last in the list
                last_item = "└─",
                -- When there are nested child guides to the right
                nested_top = "│ ",
                -- Raw indentation
                whitespace = "  ",
            },


        })
        -- You probably also want to set a keymap to toggle aerial
        vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")


    end
}
