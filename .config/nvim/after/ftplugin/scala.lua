-- tmux auto run
vim.keymap.set('n', '<leader>.',        '<cmd>wall<CR><cmd>silent exec "!tmux_repeat"<CR>',{noremap=true, silent=true})
