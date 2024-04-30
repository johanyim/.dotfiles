require'nvim-tmux-navigation'.setup {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-A-h>",
        down = "<C-A-j>",
        up = "<C-A-k>",
        right = "<C-A-l>",
        last_active = "<C-A-\\>",
        next = "<C-A-Space>",
    }
}
