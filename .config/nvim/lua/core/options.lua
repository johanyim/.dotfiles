-- side numbers
vim.wo.number = true
-- vim.wo.relativenumber = true

-- see the keys being pressed
vim.opt.showcmd = true
-- see help
vim.opt.laststatus = 2
--
vim.opt.autowrite = true

vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.history = 10000


-- show mode in command area
vim.opt.showmode = false

-- tabs
local TAB_SIZE = 4
vim.opt.tabstop = TAB_SIZE
vim.opt.shiftwidth = TAB_SIZE
-- roud to nearest tabsize
vim.opt.shiftround = true
-- use spaces for tab
vim.opt.expandtab = true


-- indentations
vim.opt.autoindent = true
vim.opt.smartindent = true
-- -- read more on this
-- vim.opt.cindent = true

vim.opt.hlsearch = true
-- vim.opt.ignorecase = false
vim.opt.smartcase = true


-- tab completion options as a menu
vim.opt.wildmenu = true



-- space between line and bottom/top of buffer
local SCROLL_OFF = 4
vim.opt.scrolloff= SCROLL_OFF
-- vim.opt.sidescrolloff= 20

-- TESTING this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

-- use term gui colors 
vim.opt.termguicolors = true

-- python 2/3 support
-- vim.g.python2_host_prog = ''
vim.g.python3_host_prog = '/usr/bin/python'

