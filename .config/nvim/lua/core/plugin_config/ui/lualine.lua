local colors = require("catppuccin.palettes").get_palette("mocha")
local config = {
    options = {
        icons_enabled = true,
        theme = {
            normal = {
                a = {fg = colors.blue, bg = colors.crust},
                b = {fg = colors.mauve, bg = colors.crust},
                c = {fg = colors.surface1, bg = colors.crust},
                x = {fg = colors.surface0, bg = colors.crust},
                y = {fg = colors.surface1, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},
            },
            insert = {
                a = {fg = colors.green, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
            visual = {
                a = {fg = colors.mauve, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
            command = {
                a = {fg = colors.peach, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
            replace = {
                a = {fg = colors.red, bg = colors.crust},
                z = {fg = colors.surface1, bg = colors.crust},},
        },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'}, -- {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'}, -- + lsp progress
        lualine_x = {{'filetype', icon = {align = 'right'}},}, -- {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
}

-- lsp progress
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

ins_left {
	'lsp_progress',
	-- display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' }},
	-- With spinner
	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
	-- colors = {
	--   percentage  = colors.cyan,
	--   title  = colors.cyan,
	--   message  = colors.cyan,
	--   spinner = colors.cyan,
	--   lsp_client_name = colors.magenta,
	--   use = true,
	-- },
    separators = {
        component = ' ',
        progress = ' | ',
        message = { pre = '(', post = ')'},
        percentage = { pre = '', post = '%% ' },
        title = { pre = '', post = ': ' },
        lsp_client_name = { pre = '[', post = ']' },
        spinner = { pre = '', post = '' },
    },
    message = { commenced = '...', completed = 'OK' },
	--
    display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' } },
	timer = { progress_enddelay = 1000, lsp_client_name_enddelay = 5000 },
	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
	-- spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
    -- timer = { progress_enddelay = 200, spinner = 100, lsp_client_name_enddelay = 10000 },
}


require('lualine').setup(config)
