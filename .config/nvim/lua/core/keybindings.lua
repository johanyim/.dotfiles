-- system clipboard yanking with control + c
-- control + p works as well
-- vim.keymap.set('n','<leader>h',     ':nohlsearch<CR>')
vim.keymap.set('n','<C-y>',             '"*y :let @+=@*<CR>',{noremap=true})
vim.keymap.set('v','<C-y>',             '"*y :let @+=@*<CR>',{noremap=true})

-- moving words with control and arrow like I'm used to
vim.keymap.set('n','<C-Right>',         'e',{noremap=true})
vim.keymap.set('v','<C-Right>',         'e',{noremap=true})
vim.keymap.set('n','<C-Left>',          'b',{noremap=true})
vim.keymap.set('v','<C-Left>',          'b',{noremap=true})
vim.keymap.set('i','<C-Right>',          '<esc>ea',{noremap=true})

vim.keymap.set('n', '<PageUp>',         '_',{noremap=true})
vim.keymap.set('n', '<PageDown>',       '$',{noremap=true})

