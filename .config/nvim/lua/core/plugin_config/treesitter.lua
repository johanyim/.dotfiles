require('nvim-treesitter.configs').setup {
    ensure_installed = {"rust","lua","python","vim","markdown"},

    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
}


vim.keymap.set("n",    "ge",
    function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end,
    { noremap = true, silent = false }
)
vim.keymap.set("n",    "ge",
    function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end,
    { noremap = true, silent = false }
)
