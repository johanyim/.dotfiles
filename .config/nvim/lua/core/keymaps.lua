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

local SCROLL_OFF = 5
vim.opt.scrolloff= SCROLL_OFF

-- system clipboard yanking with control + c
-- control + p works as well
vim.keymap.set('n','<leader>h',     ':nohlsearch<CR>')
vim.keymap.set('n','<C-y>',         '"*y :let @+=@*<CR>',{noremap=true})
vim.keymap.set('v','<C-y>',         '"*y :let @+=@*<CR>',{noremap=true})

-- moving words with control and arrow like I'm used to
vim.keymap.set('i','<C-Right>',         '<esc>ea',{noremap=true})
vim.keymap.set('n','<C-Right>',         'e',{noremap=true})
vim.keymap.set('v','<C-Right>',         'e',{noremap=true})
vim.keymap.set('i','<C-Left>',          '<esc>bi',{noremap=true})
vim.keymap.set('n','<C-Left>',          'b',{noremap=true})

