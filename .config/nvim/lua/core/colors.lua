local colors = require("catppuccin.palettes").get_palette("mocha")

-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red, bg = "#1e1e2e"});
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarning", { fg = colors.yellow, bg = "#1e1e2e"});
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.sapphire, bg = "#1e1e2e"});
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.teal, bg = "#1e1e2e"});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.red,});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarning", { fg = colors.yellow,});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.sapphire,});
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.teal, });


local this

