local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

config.pane_focus_follows_mouse = true
config.scrollback_lines = 5000

-- leader
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- theme
local scheme = "Catppuccin Mocha"
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]

config.color_scheme = scheme
config.colors = {
	tab_bar = {
		background = "#181825",
		active_tab = {
			bg_color = "#181825",
			fg_color = "#cba6f7",
		},
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#9399b2",
		},
		new_tab = {
			bg_color = "#181825",
			fg_color = "#cdd6f4",
		},
	},
}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.win32_system_backdrop = 'Tabbed'
end

-- Switch between just an opacity and a background image based on whether we are fullscreen
local function set_background(config, is_fullscreen)
	if is_fullscreen then
		if wezterm.target_triple == "x86_64-pc-windows-msvc" then
			wezterm.log_info("Fullscreen detected, setting background to opaque")
			config.window_background_opacity = 0
		else
			config.window_background_opacity = nil
		end
		config.background = {
			{
				source = {
					File = { path = wezterm.home_dir .. '/.config/background.jpg' },
				},
				attachment = { Parallax = 0.1 },
				repeat_y = 'Mirror',
				horizontal_align = 'Center',
				opacity = 0.4,
				hsb = {
					hue = 1.0,
					saturation = 0.95,
					brightness = 0.5,
				},
			},
		}
	else
		if wezterm.target_triple == "x86_64-pc-windows-msvc" then
			config.window_background_opacity = 0
		else
			config.window_background_opacity = 0.85
		end
		config.background = nil
	end
end

wezterm.on('window-resized', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local is_fullscreen = window:get_dimensions().is_full_screen
	set_background(overrides, is_fullscreen)
	window:set_config_overrides(overrides)
end)

-- inactive pane dimming
config.inactive_pane_hsb = {
	saturation = 0.6,
	brightness = 0.5,
}

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}

-- status bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "Catppuccin Mocha",
		section_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		component_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thin,
			right = wezterm.nerdfonts.ple_left_half_circle_thin,
		},
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
	},
	sections = {
		tabline_a = { { "mode", padding = { left = 3, right = 1 } } },
		tabline_b = {
			{
				"workspace",
				icons_enabled = false,
				fmt = function(workspace, window)
					if window:leader_is_active() then
						return "◎" .. " " .. workspace
					end

					return "○" .. " " .. workspace
				end,
			},
		},
		tabline_c = { " " },
		tab_active = {
			"index",
			{ "parent", padding = 0 },
			"/",
			{ "cwd",    padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = {},
		tabline_y = { "battery" },
		tabline_z = {
			{
				"datetime",
				padding = { left = 1, right = 3 },
				style = "%H:%M",
				hour_to_icon = {
					["00"] = wezterm.nerdfonts.md_clock_time_twelve_outline,
					["01"] = wezterm.nerdfonts.md_clock_time_one_outline,
					["02"] = wezterm.nerdfonts.md_clock_time_two_outline,
					["03"] = wezterm.nerdfonts.md_clock_time_three_outline,
					["04"] = wezterm.nerdfonts.md_clock_time_four_outline,
					["05"] = wezterm.nerdfonts.md_clock_time_five_outline,
					["06"] = wezterm.nerdfonts.md_clock_time_six_outline,
					["07"] = wezterm.nerdfonts.md_clock_time_seven_outline,
					["08"] = wezterm.nerdfonts.md_clock_time_eight_outline,
					["09"] = wezterm.nerdfonts.md_clock_time_nine_outline,
					["10"] = wezterm.nerdfonts.md_clock_time_ten_outline,
					["11"] = wezterm.nerdfonts.md_clock_time_eleven_outline,
					["12"] = wezterm.nerdfonts.md_clock_time_twelve_outline,
					["13"] = wezterm.nerdfonts.md_clock_time_one_outline,
					["14"] = wezterm.nerdfonts.md_clock_time_two_outline,
					["15"] = wezterm.nerdfonts.md_clock_time_three_outline,
					["16"] = wezterm.nerdfonts.md_clock_time_four_outline,
					["17"] = wezterm.nerdfonts.md_clock_time_five_outline,
					["18"] = wezterm.nerdfonts.md_clock_time_six_outline,
					["19"] = wezterm.nerdfonts.md_clock_time_seven_outline,
					["20"] = wezterm.nerdfonts.md_clock_time_eight_outline,
					["21"] = wezterm.nerdfonts.md_clock_time_nine_outline,
					["22"] = wezterm.nerdfonts.md_clock_time_ten_outline,
					["23"] = wezterm.nerdfonts.md_clock_time_eleven_outline,
				},
			},
		},
	},
})

-- Maximize on startup
if wezterm.target_triple ~= "x86_64-pc-windows-msvc" then
	wezterm.on("gui-startup", function()
		local tab, pane, window = mux.spawn_window({})
		window:gui_window():maximize()
	end)
end

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- font
	config.font = wezterm.font({
		family = "FiraCode Nerd Font Mono",
		weight = "Regular",
	})
	-- IMPORTANT: Sets WSL2 UBUNTU as the defualt when opening Wezterm
	config.default_domain = "WSL:Ubuntu"
	config.color_scheme_dirs = { "/mnt/c/Users/chad.jones/colors" }
	-- key mapping
	config.keys = {
		{ key = "d", mods = "SHIFT|ALT",    action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "ALT",                action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "[", mods = "ALT",                action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "ALT",                action = act.ActivateTabRelative(1) },
		{ key = "w", mods = "ALT",                action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "c", mods = "ALT",                action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "ALT",                action = act.PasteFrom("Clipboard") },
		{ key = "n", mods = "ALT",                action = act.SpawnWindow },
		{ key = "t", mods = "ALT",                action = act.SpawnTab("DefaultDomain") },
		{ key = 'f', mods = 'ALT',          action = act.TogglePaneZoomState },
		{ key = 'w', mods = 'LEADER',       action = act.ShowTabNavigator },
		{ key = '[', mods = 'LEADER',       action = act.PaneSelect { mode = 'Activate' } },
		{ key = ']', mods = 'LEADER',       action = act.PaneSelect { mode = 'Activate' } },
		{ key = '{', mods = 'LEADER|SHIFT', action = act.PaneSelect { mode = 'SwapWithActiveKeepFocus' } },
		{ key = '}', mods = 'LEADER|SHIFT', action = act.PaneSelect { mode = 'SwapWithActiveKeepFocus' } },
		{
			key = "k",
			mods = "ALT",
			action = act.Multiple({
				act.ClearScrollback("ScrollbackAndViewport"),
				act.SendKey({ key = "l", mods = "CTRL" }),
			}),
		},
	}
end

-- Apple Silicon Mac
if wezterm.target_triple == "aarch64-apple-darwin" then
	-- avoid the notch
	config.native_macos_fullscreen_mode = true
	-- window
	config.window_decorations = "RESIZE"
	-- font
	config.font = wezterm.font({
		family = "FiraCode Nerd Font Mono",
		weight = "Regular",
	})
	config.font_size = 14.0
	config.macos_window_background_blur = 20
	-- key mapping
	config.keys = {
		{ key = "d", mods = "SHIFT|CMD",    action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD",                action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "[", mods = "CMD",                action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "CMD",                action = act.ActivateTabRelative(1) },
		{ key = "w", mods = "CMD",          action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "n", mods = "CMD",          action = act.SpawnWindow },
		{ key = "t", mods = "CMD",           action = act.SpawnTab("DefaultDomain") },
		{ key = 'f', mods = 'ALT',          action = act.TogglePaneZoomState },
		{ key = "x", mods = "LEADER",             action = act.CloseCurrentTab({ confirm = true }) },
		{ key = 'w', mods = 'LEADER',             action = act.ShowTabNavigator },
		{ key = '[', mods = 'LEADER',             action = act.PaneSelect { mode = 'Activate' } },
		{ key = ']', mods = 'LEADER',       action = act.PaneSelect { mode = 'Activate' } },
		{ key = '{', mods = 'LEADER|SHIFT', action = act.PaneSelect { mode = 'SwapWithActiveKeepFocus' } },
		{ key = '}', mods = 'LEADER|SHIFT', action = act.PaneSelect { mode = 'SwapWithActiveKeepFocus' } },
		{
			key = "k",
			mods = "CMD",
			action = act.Multiple({
				act.ClearScrollback("ScrollbackAndViewport"),
				act.SendKey({ key = "l", mods = "CTRL" }),
			}),
		},
	}
end

-- Linux
if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
end

-- extra keys
for i = 1, 8 do
	-- CTRL + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

-- stop the noise
config.audible_bell = "Disabled"

-- smart splits
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config)

return config
