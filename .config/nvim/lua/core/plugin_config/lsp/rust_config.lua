local rust_tools = require("rust-tools")
rust_tools.setup({
    server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    tools = {
        hover_actions = {
            auto_focus = false,
            border = {
                { "┌", "Comment" },
                { "─", "Comment" },
                { "┐", "Comment" },
                { "│", "Comment" },
                { "┘", "Comment" },
                { "─", "Comment" },
                { "└", "Comment" },
                { "│", "Comment" },
            }
        },
    },
})

local crates = require("crates")
crates.setup()

