vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = { "*.md", "*.wiki" },
	callback = function()
		-- vim.cmd('ZenMode')
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md", "*.wiki" },
	callback = function()
		vim.cmd("PencilSoft")
		vim.cmd("set spell")
		vim.keymap.set("n", "<Space>m", ":MarkdownPreviewToggle<enter>", { noremap = true })
		vim.keymap.set("n", "<Space>z", ":ZenMode<enter>", { noremap = true })
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local telescope = require("telescope.builtin")
		if vim.bo.filetype ~= "" then
			return
		end
		if vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
			-- vim.cmd("Telescope oldfiles")
			telescope.oldfiles({ default_text = vim.fn.argv(0) })
			-- telescope.find_files({default_text = vim.fn.argv(0) })
		end
	end,
})

-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = "LspAttach_inlayhints",
--     callback = function(args)
--         if not (args.data and args.data.client_id) then
--             return
--         end
--
--         local bufnr = args.buf
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         require("lsp-inlayhints").on_attach(client, bufnr)
--     end,
-- })
