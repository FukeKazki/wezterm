local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- Font
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 16.0
-- Color scheme
config.color_scheme = "Catppuccin Macchiato (Gogh)"

-- key bindings
config.disable_default_key_bindings = true
-- leader key
config.leader = { key = "Space", mods = "CTRL|SHIFT" }

config.keys = {
	-- split pane
	{ key = "s", mods = "CTRL", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "CTRL", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	-- move pane
	{ key = "LeftArrow", mods = "SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "RightArrow", mods = "SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "UpArrow", mods = "SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "DownArrow", mods = "SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	-- move tab
	{ key = "Tab", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = -1 }) },
	-- copy
	{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	-- paste
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	-- Leaderキーを押した後にrを押すと、リサイズモードに入る
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
}
config.key_tables = {
	-- リサイズモード
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- layout
config.window_padding = {
	left = 4,
	right = 4,
	top = 4,
	bottom = 4,
}
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
return config