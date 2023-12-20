-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Storm'


config.default_cursor_style = 'BlinkingBar'
config.font = wezterm.font 'FiraCode Nerd Font'

config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.enable_tab_bar = false
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
-- and finally, return the configuration to wezterm
return config
