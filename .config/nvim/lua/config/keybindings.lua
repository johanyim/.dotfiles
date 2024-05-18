local set = vim.keymap.set

-- system clipboard yanking with control + c
-- control + p works as well
-- vim.keymap.set('n','<leader>h',     ':nohlsearch<CR>')
set('n','<C-y>',             '"*y :let @+=@*<CR>',{noremap=true, desc="Copy to clipboard"})
set('v','<C-y>',             '"*y :let @+=@*<CR>',{noremap=true, desc="Copy to clipboard"})

-- moving words with control and arrow like I'm used to
set('n','<C-Right>',         'e',{noremap=true, desc="C-Arrow move right"})
set('v','<C-Right>',         'e',{noremap=true, desc="C-Arrow move right"})
set('n','<C-Left>',          'b',{noremap=true, desc="C-Arrow move left"})
set('v','<C-Left>',          'b',{noremap=true, desc="C-Arrow move left"})
set('i','<C-Right>',         '<esc>ea',{noremap=true, desc="C-Arrow move right"})

-- clear search
set('n','<C-/>',             ':noh<CR>',{noremap=true, silent=true, desc="Clear search buffer"})

-- stupid page up and down
set('n', '<PageUp>',         '_',{noremap=true, desc="Go to first non-whitespace"})
set('n', '<PageDown>',       '$',{noremap=true, desc="Go to last non-whitespace"})
set('i', '<PageUp>',         '<esc>_i',{noremap=true, desc="Go to first non-whitespace"})
set('i', '<PageDown>',       '<esc>$a',{noremap=true, desc="Go to last non-whitespace"})
-- tmux auto run
set('n', '<leader>.',        '<cmd>wall<CR><cmd>silent exec "!tmux_cancel_repeat"<CR>',{noremap=true, silent=true, desc="Repeat command of adjacent tmux window"})

-- sourcing
set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- height/width of splits
set("n", "<M-H>", "<c-w>5<")
set("n", "<M-L>", "<c-w>5>")
set("n", "<M-J>", "<C-W>2+")
set("n", "<M-K>", "<C-W>2-")

