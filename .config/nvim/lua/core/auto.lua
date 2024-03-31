vim.api.nvim_create_autocmd({"VimEnter"}, {
    pattern = {"*.md", "*.wiki"},
    callback = function()
        vim.cmd('ZenMode')
        vim.keymap.set('n', '<Space>m',':MarkdownPreviewToggle<enter>',{noremap=true})
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.md", "*.wiki"},
    callback = function()
        vim.cmd('PencilSoft')
        vim.cmd('set spell')
        vim.keymap.set('n', '<Space>m',':MarkdownPreviewToggle<enter>',{noremap=true})
        vim.keymap.set('n', '<Space>z',':ZenMode<enter>',{noremap=true})
    end
})


vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.bo.filetype ~= '' then
            return
        end
        if vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == '' then
            vim.cmd("Telescope oldfiles")
        end
    end,
})

