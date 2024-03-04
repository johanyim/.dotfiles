local base = "core.plugin_config"
local files = {
    {"color", {
        "catppuccin",
        "colorizer",
        "todo_comments",
        -- "ts_rainbow",
    }},
    {"lsp", {
        "aerial",
        "completions",
        "diagnostic_lines",
        "lsp_config",
        "rust_config",
        "treesitter",
    }},
    {"ui", {
        "gitsigns",
        "lualine",
        -- "nvim_tree",
        "oil",
        "telescope",
        "tmux",
        "toggleterm",
        "trouble",
    }},
    {"workflow", {
      "comment",
      "harpoon",
      "live_server",
      "null_ls",
      "nvim_surround",
    }},
    {"writing", {
        "headlines",
        "markdown_preview",
        "vimtex",
        "zen_mode",
    }},
}

for _, category in ipairs(files) do
    local category_name = category[1]
    local sub_files = category[2]
    for _, file_name in ipairs(sub_files) do
        require(base .. "." .. category_name .. "." .. file_name)
    end
end

