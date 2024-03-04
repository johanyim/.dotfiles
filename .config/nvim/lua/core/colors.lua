local colors = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red,});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarning", { fg = colors.yellow,});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.sapphire,});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.teal, });
