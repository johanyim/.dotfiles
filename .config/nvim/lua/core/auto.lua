vim.api.nvim_create_autocmd({"VimEnter"}, {
    pattern = "*.md",
    callback = function()
        vim.cmd('ZenMode')
        vim.keymap.set('n', '<Space>m',':MarkdownPreviewToggle<enter>',{noremap=true})
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.md",
    callback = function()
        vim.cmd('PencilSoft')
        vim.cmd('set spell')
        vim.keymap.set('n', '<Space>m',':MarkdownPreviewToggle<enter>',{noremap=true})
        vim.keymap.set('n', '<Space>z',':ZenMode<enter>',{noremap=true})
    end
})
