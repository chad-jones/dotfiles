local if_nil = vim.F.if_nil

require("alpha.term")
local dashboard = require("alpha.themes.dashboard")

-- Terminal header
dashboard.section.terminal.command = "cat | lolcat --seed=27 " .. os.getenv("HOME") .. "/.config/nvim/static/neovim.cat"
dashboard.section.terminal.width = 69
dashboard.section.terminal.height = 8

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButtonText"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end

dashboard.section.buttons.val = {
  button("l", "   Load session", ':lua require("persisted").load()<CR>'),
  button("n", "   New file", ":ene <BAR> startinsert <CR>"),
  button("b", "   Bookmarks", ":Telescope harpoon marks<CR>"),
  button("r", "   Recently used files", ":Telescope frecency<CR>"),
  button("f", "   Find file", ":Telescope find_files hidden=true path_display=smart<CR>"),
  button("u", "   Update plugins", ":lua require('packer').sync()<CR>"), -- Packer sync
  button("q", "   Quit Neovim", ":qa!<CR>"),
}
dashboard.section.buttons.opts = {
  spacing = 0,
}

-- Footer
local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local version = vim.version()
  local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

  return " " .. total_plugins .. " plugins" .. nvim_version_info
end
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"

local section = {
    terminal = dashboard.section.terminal,
    buttons = dashboard.section.buttons,
    footer = dashboard.section.footer,
}

local config = {
    layout = {
        { type = "padding", val = 1 },
        section.terminal,
        { type = "padding", val = 9 },
        section.buttons,
        { type = "padding", val = 1 },
        section.footer,
    },
    opts = {
        noautocmd = true,
    },
}

return {
    button = button,
    section = section,
    config = config,
    -- theme config
    leader = leader,
    -- deprecated
    opts = config,
}
