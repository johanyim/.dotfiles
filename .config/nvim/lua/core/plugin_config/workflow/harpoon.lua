require("telescope").load_extension("harpoon")
local HarpoonUi = require("harpoon.ui")


-- vim.keymap.set('n', '<space>h', require('harpoon.mark').add_file)
-- vim.keymap.set('n', '<space>j', HarpoonUi.nav_next)
-- vim.keymap.set('n', '<space>k', HarpoonUi.nav_prev)
-- vim.keymap.set('n', '<space>l', HarpoonUi.toggle_quick_menu)
-- vim.keymap.set('n', '<space>L', ':Telescope harpoon marks<cr>')
vim.keymap.set('n', '<A-h>', require('harpoon.mark').add_file)
vim.keymap.set('n', '<A-j>', HarpoonUi.nav_next)
vim.keymap.set('n', '<A-k>', HarpoonUi.nav_prev)
vim.keymap.set('n', '<A-l>', HarpoonUi.toggle_quick_menu)
vim.keymap.set('n', '<A-L>', ':Telescope harpoon marks<cr>')
-- vim.keymap.set('n', '<space>t', function() require("harpoon.term").gotoTerminal(1) end )

require('harpoon').setup({
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = " |",
    tabline_suffix = "| ",
})



