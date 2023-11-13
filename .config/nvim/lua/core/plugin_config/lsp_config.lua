require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "bashls" },
})

local on_attach = function(_,_)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", require('telescpe.builtin').lsp_references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
}
require("lspconfig").bashls.setup {
    capabilities = capabilities,
}
