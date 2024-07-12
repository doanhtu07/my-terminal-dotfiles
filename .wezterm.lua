-- Source, check in the comment section: https://www.youtube.com/watch?v=uOnL4fEnldA

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#706b4e",
	selection_fg = "#f3d9c4",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- https://github.com/wez/wezterm/issues/2326
config.cursor_thickness = "1pt"
config.underline_thickness = "2pt"

-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 8

-- https://wezfurlong.org/wezterm/config/font-shaping.html#advanced-font-shaping-options
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Make font more bold
-- https://www.reddit.com/r/neovim/comments/1424lkj/the_problem_that_fonts_cannot_be_bolded_in_wezterm/
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
	},
}

-- and finally, return the configuration to wezterm
return config
