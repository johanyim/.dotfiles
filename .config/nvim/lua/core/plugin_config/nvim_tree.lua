vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<C-m>', '<cmd>NvimTreeFocus<CR>')





