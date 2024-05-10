return {
    "NvChad/nvim-colorizer.lua",
    config = function () 
        require("colorizer").setup({
            -- tailwind = true;
            user_default_options = {
                tailwind = true,
                sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
            }
        })
    end 
}
