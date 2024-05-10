return {
    "aurum77/live-server.nvim",
    build = function()
        require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    config = function ()

        local live_server = require("live_server")

        live_server.setup({
            port = 3000,
            browser_command = "", -- Empty string starts up with default browser
            quiet = false,
            no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
            install_path = vim.fn.stdpath "config" .. "/live-server/",
        })

    end
}
