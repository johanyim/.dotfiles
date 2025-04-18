-- vim.g.mapleader = ','
-- vim.g.maplocalleader = ','
-- require("core.keybindings")
-- require("core.options")
-- require("core.plugins")
-- require("core.plugin_config")
-- require("core.colors")
-- require("core.auto")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.autocmd")
require("config.keybindings")
require("lazy").setup("plugins")
local opts = {}
