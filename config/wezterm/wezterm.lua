local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- theme
config.color_scheme = 'carbonfox'

-- window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"


config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- Windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- IMPORTANT: Sets WSL2 UBUNTU as the defualt when opening Wezterm
  config.default_domain = 'WSL:Ubuntu'
  config.color_scheme_dirs = { '/mnt/c/Users/chad.jones/colors' }
  -- key mapping
  config.keys = {
    { key = "d",          mods = "SHIFT|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "d",          mods = "ALT",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "DownArrow",  mods = "SHIFT",     action = act.ActivatePaneDirection("Down") },
    { key = "DownArrow",  mods = "SHIFT|ALT", action = act.AdjustPaneSize { 'Down', 1 } },
    { key = "UpArrow",    mods = "SHIFT",     action = act.ActivatePaneDirection("Up") },
    { key = "UpArrow",    mods = "SHIFT|ALT", action = act.AdjustPaneSize { 'Up', 1 } },
    { key = "LeftArrow",  mods = "SHIFT",     action = act.ActivatePaneDirection("Left") },
    { key = "LeftArrow",  mods = "SHIFT|ALT", action = act.AdjustPaneSize { 'Left', 1 } },
    { key = "RightArrow", mods = "SHIFT",     action = act.ActivatePaneDirection("Right") },
    { key = "RightArrow", mods = "SHIFT|ALT", action = act.AdjustPaneSize { 'Right', 1 } },
    { key = "w",          mods = "ALT",       action = act.CloseCurrentPane({ confirm = true }) },
    { key = "r",          mods = "LEADER",    action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
    { key = "Enter",      mods = "LEADER",    action = act.ActivateCopyMode },
    { key = "c",          mods = "ALT",       action = act.CopyTo("Clipboard") },
    { key = "n",          mods = "ALT",       action = act.SpawnWindow },
    { key = "t",          mods = "ALT",       action = act.SpawnTab 'DefaultDomain' },
    { key = "v",          mods = "ALT",       action = act.PasteFrom("Clipboard") },
    { key = 'k',          mods = "ALT",       action = act.Multiple {
      act.ClearScrollback "ScrollbackAndViewport",
      act.SendKey { key = "l", mods = "CTRL" },
    }},
    {
      key = ",",
      mods = "LEADER",
      action = act.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  }
  end

-- Apple Silicon Mac
if wezterm.target_triple == 'aarch64-apple-darwin' then
  -- font
  config.font = wezterm.font {
    family = 'FiraCode Nerd Font Mono',
    weight = 'Regular',
  }
  config.font_size = 14.0
  config.macos_window_background_blur = 20-- key mapping
  config.keys = {
    { key = "d",          mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "d",          mods = "CMD",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "DownArrow",  mods = "SHIFT",     action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "UpArrow",    mods = "SHIFT",     action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "LeftArrow",  mods = "SHIFT",     action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "SHIFT",     action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "w",          mods = "CMD",       action = act.CloseCurrentPane({ confirm = true }) },
    { key = "r",          mods = "LEADER",    action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
    { key = "Enter",      mods = "LEADER",    action = act.ActivateCopyMode },
    { key = "c",          mods = "CMD",       action = act.CopyTo("Clipboard") },
    { key = "n",          mods = "CMD",       action = act.SpawnWindow },
    { key = "t",          mods = "CMD",       action = act.SpawnTab 'DefaultDomain' },
    { key = "v",          mods = "CMD",       action = act.PasteFrom("Clipboard") },
    {
      key = ",",
      mods = "LEADER",
      action = act.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  }
  end

-- Linux
if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
end

-- stop the noise
config.audible_bell = "Disabled"

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.15,
}

return config