-- side numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- see the keys being pressed
vim.opt.showcmd = true
-- see help
vim.opt.laststatus = 2
--
vim.opt.autowrite = true

vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.history = 10000

-- use spaces for tab
vim.opt.showmode = false
local TAB_SIZE = 4
vim.opt.tabstop = TAB_SIZE
vim.opt.shiftwidth = TAB_SIZE
vim.opt.shiftround = true
vim.opt.expandtab = true

local SCROLL_OFF = 4
vim.opt.scrolloff= SCROLL_OFF


-- use term gui colors 
vim.opt.termguicolors = true
