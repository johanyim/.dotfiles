return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    config = function ()
        local trouble = require("trouble")
        local colors = require("catppuccin.palettes").get_palette("mocha")

        vim.keymap.set("n", "<leader>p", function()
            trouble.toggle("workspace_diagnostics")
        end )

        trouble.setup {
            position = "right",
            width = 30,
            padding = false,
            vim.api.nvim_set_hl(0, "TroubleCount", { fg=colors.surface2});
            vim.api.nvim_set_hl(0, "TroubleCount", { fg=colors.surface2});
        }

    end
}

