local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action


-- theme
config.color_scheme = 'carbonfox'

-- window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- key mapping
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
end

-- Apple Silicon Mac
if wezterm.target_triple == 'aarch64-apple-darwin' then
  -- font
  config.font = wezterm.font {
    family = 'FiraCode Nerd Font Mono',
    weight = 'Regular',
  }
  config.font_size = 14.0
  config.macos_window_background_blur = 20
end

-- Linux
if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
end

return config
