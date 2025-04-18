local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#11111B"
custom.cursor_bg = "#cdd6f4"
custom.cursor_fg = "#1e1e2e"

return {
	audible_bell = "Disabled",

	adjust_window_size_when_changing_font_size = false,
	bold_brightens_ansi_colors = true,
	cell_width = 0.9,
	-- cell_width = 1,
	line_height = 1.0,
	-- line_height = 1.1,
	cursor_blink_rate = 0,
	disable_default_mouse_bindings = false,
	-- enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	scrollback_lines = 5000,
	window_close_confirmation = "NeverPrompt",

	color_schemes = {
		["Catppuccin Mocha Ext"] = custom,
	},
	color_scheme = "Catppuccin Mocha Ext",
	font = wezterm.font("NotoSansM Nerd Font"),
	-- font = wezterm.font("ProFont IIx Nerd Font"),
	-- font = wezterm.font("Tamzen"),
	-- font = wezterm.font("Monocraft Nerd Font"),
	-- font = wezterm.font("Miracode"),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	keys = {
		{
			key = "Backspace",
			mods = "CTRL",
			action = wezterm.action.SendString("\x17"),
		},
	},
}
