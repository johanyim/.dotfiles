require'nvim-treesitter.configs'.setup {
    ensure_installed = {"rust","lua","python","vim"},

    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
