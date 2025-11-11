local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "Afterglow"
config.window_padding = {
	left = "2px",
	right = "2px",
	top = 0,
	bottom = 0,
}
config.font_size = 15.0
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.disable_default_key_bindings = true
config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("PrimarySelection") },
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	{ key = "n", mods = "CTRL|ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{
		key = "c",
		mods = "CTRL|ALT",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = ";",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "'",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "1",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "2",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "3",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "4",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Right"),
	},
}

local function update_overrides_if_changed(window, new_config)
	local overrides = window:get_config_overrides() or {}
	local diff = false
	for k, v in pairs(new_config) do
		if overrides[k] ~= v then
			diff = true
			overrides[k] = v
		end
	end
	if diff then
		window:set_config_overrides(overrides)
	end
end

-- Hide window decoration when full screen and only one tab.
wezterm.on("window-resized", function(window, _)
	local new_config
	if window:get_dimensions().is_full_screen then
		new_config = {
			hide_tab_bar_if_only_one_tab = true,
			window_decorations = "RESIZE",
			use_fancy_tab_bar = false,
		}
	else
		new_config = {
			hide_tab_bar_if_only_one_tab = false,
			window_decorations = "INTEGRATED_BUTTONS|RESIZE",
			use_fancy_tab_bar = true,
		}
	end
	update_overrides_if_changed(window, new_config)
end)

return config
