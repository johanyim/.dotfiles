return {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    config = function ()
        local null_ls = require("null-ls")

        local opts = {
            sources = {
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.ruff,
            }
        }
        return opts
    end
}
