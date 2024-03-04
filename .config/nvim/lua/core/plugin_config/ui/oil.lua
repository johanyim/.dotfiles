local oil = require("oil")

oil.setup({
    columns = {"permissions", "size", "icon"},
    experimental_watch_for_changes = true,
    view_options = {
        show_hidden = true,
    }
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", {})
