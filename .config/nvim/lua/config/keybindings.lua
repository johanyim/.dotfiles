local set = vim.keymap.set

-- system clipboard yanking with control + c
-- control + p works as well
-- vim.keymap.set('n','<leader>h',     ':nohlsearch<CR>')
set("n", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })
set("v", "<C-y>", '"*y :let @+=@*<CR>', { noremap = true, desc = "Copy to clipboard" })

-- moving words with control and arrow like I'm used to
set("n", "<C-Right>", "e", { noremap = true, desc = "C-Arrow move right" })
set("v", "<C-Right>", "e", { noremap = true, desc = "C-Arrow move right" })
set("n", "<C-Left>", "b", { noremap = true, desc = "C-Arrow move left" })
set("v", "<C-Left>", "b", { noremap = true, desc = "C-Arrow move left" })
set("i", "<C-Right>", "<esc>ea", { noremap = true, desc = "C-Arrow move right" })

-- clear search
set("n", "<A-/>", ":noh<CR>", { noremap = true, silent = true, desc = "Clear search buffer" })

-- stupid page up and down
set("n", "<PageUp>", "_", { noremap = true, desc = "Go to first non-whitespace" })
set("n", "<PageDown>", "$", { noremap = true, desc = "Go to last non-whitespace" })
set("i", "<PageUp>", "<esc>_i", { noremap = true, desc = "Go to first non-whitespace" })
set("i", "<PageDown>", "<esc>$a", { noremap = true, desc = "Go to last non-whitespace" })
-- tmux auto run
set(
	"n",
	"<leader>.",
	'<cmd>wall<CR><cmd>silent exec "!tmux_cancel_repeat"<CR>',
	{ noremap = true, silent = true, desc = "Repeat command of adjacent tmux window" }
)

-- sourcing
set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- height/width of splits
set("n", "<M-H>", "<c-w>5<")
set("n", "<M-L>", "<c-w>5>")
set("n", "<M-J>", "<C-W>2+")
set("n", "<M-K>", "<C-W>2-")

-- Ensure the tohtml module is available
local tohtml = require("tohtml")

-- Function to convert to HTML and open in a new buffer
local function convert_to_html_in_new_buffer()
	-- Convert the current buffer to HTML
	local html_output = tohtml.tohtml(nil, { number_lines = false })

	-- Create a new buffer
	local new_buf = vim.api.nvim_create_buf(false, true)

	-- Open a new split window and set the new buffer to it
	vim.api.nvim_command("vsplit")
	vim.api.nvim_win_set_buf(0, new_buf)

	-- Set the buffer content to the HTML output
	vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, html_output)

	-- Optionally set the filetype to html for syntax highlighting
	vim.bo[new_buf].filetype = "html"
end

local function selection_to_html(opts)
	-- save the selected lines
	local start_line = opts.line1
	local end_line = opts.line2

	-- convert into raw html
	local html_output = tohtml.tohtml(nil, { number_lines = false })

	-- Create a new buffer
	local new_buf = vim.api.nvim_create_buf(false, true)

	-- open a new split window with html contents inside
	vim.api.nvim_command("vsplit")
	vim.api.nvim_win_set_buf(0, new_buf)
	vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, html_output)
	vim.bo[new_buf].filetype = "html"

	-- remove the css font and body setting, because it messes with the rest of the document
	vim.api.nvim_command(":%s/\\* {font-family: monospace}$/")

	-- STYLES
	vim.fn.search("<style>", "w")
	vim.cmd('normal! "syat', true)

	-- BODY
	vim.fn.search("<pre>", "w")

	-- because end - start may be 0, and 0 is not a valid quantity
	local movement = "j"
	if end_line - start_line == 0 then
		movement = ""
	end

	local command = start_line .. "jV" .. (end_line - start_line) .. movement .. '"bygg'
	vim.cmd("normal! " .. command)

	-- clear all
	vim.cmd("normal! ggdG")

	-- paste BODY
	vim.cmd('normal! gg0"bP') -- there will be one blank line

	-- surround in pre tags
	vim.api.nvim_buf_set_lines(new_buf, 0, 0, false, { "<pre>" })
	local new_last_line = vim.api.nvim_buf_line_count(new_buf) - 1
	vim.api.nvim_buf_set_lines(new_buf, new_last_line, new_last_line, false, { "</pre>" })

	-- paste styles
	vim.cmd('normal! gg0"sP')
end

vim.api.nvim_create_user_command("CodeHTML", function(opts)
	selection_to_html(opts)
end, { range = true })

-- Map <A-q> to call the above function
vim.api.nvim_set_keymap("x", "<A-q>", "<cmd>CodeHTML<CR>", {
	noremap = true,
	silent = true,
	-- callback = convert_to_html_in_new_buffer,
})
