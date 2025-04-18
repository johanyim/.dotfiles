return {
    'alexghergh/nvim-tmux-navigation',
    config = function ()
        require('nvim-tmux-navigation').setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left =  "<A-h>",
                down =  "<A-j>",
                up =    "<A-k>",
                right = "<A-l>",
                last_active = "<A-\\>",
                next =  "<A-Space>",
            }
        }
    end
}


