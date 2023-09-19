vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- system clipboard yanking with control + c
-- control + p works as well
vim.keymap.set('n','<leader>h',     ':nohlsearch<CR>')
vim.keymap.set('n','<C-c>',         '"*y :let @+=@*<CR>',{noremap=true})
vim.keymap.set('v','<C-c>',         '"*y :let @+=@*<CR>',{noremap=true})
vim.keymap.set('n','<C-v>',         '"+P',{noremap=true})
vim.keymap.set('v','<C-v>',         '"+P',{noremap=true})
