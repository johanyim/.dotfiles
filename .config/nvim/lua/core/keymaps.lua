vim.wo.number = true
vim.wo.relativenumber = true

vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tab
local TAB_SIZE = 4
vim.opt.tabstop = TAB_SIZE
vim.opt.shiftwidth = TAB_SIZE
vim.opt.shiftround = true
vim.opt.expandtab = true

-- system clipboard yanking with control + c
-- control + p works as well
vim.keymap.set('n','<leader>h',     ':nohlsearch<CR>')
vim.keymap.set('n','<C-c>',         '"*y :let @+=@*<CR>',{noremap=true})
vim.keymap.set('v','<C-c>',         '"*y :let @+=@*<CR>',{noremap=true})
vim.keymap.set('n','<C-v>',         '"+P',{noremap=true})
vim.keymap.set('v','<C-v>',         '"+P',{noremap=true})
