-- syntax on
vim.opt.completeopt    = 'menu,menuone,preview'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.clipboard      = 'unnamedplus'
vim.opt.equalalways    = false
vim.opt.ignorecase     = true

-- ignore case unless search string contains uppercase
vim.opt.smartcase      = true
vim.opt.compatible     = false
vim.opt.incsearch      = true

-- do incremental searching
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.visualbell     = true
vim.opt.ruler          = true
vim.opt.smartindent    = true
vim.opt.hlsearch       = true
vim.opt.virtualedit    = 'all'
vim.opt.backspace      = 'indent,eol,start'

vim.opt.list = true
vim.opt.listchars:append("eol:↲")
vim.opt.listchars:append("tab:━━")
vim.opt.listchars:append("nbsp:+")
vim.opt.listchars:append("trail:●")
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("extends:≫")
vim.opt.listchars:append("precedes:≪")
vim.api.nvim_command("hi Whitespace guifg=#ff0000")

-- Disable code folding on open
vim.opt.foldenable = false

-- allow backspacing over everything in insert mode
vim.opt.autoindent     = true

-- mouse support
vim.opt.mouse          = 'a'

-- splits
vim.opt.splitbelow     = true
vim.opt.splitright     = true

-- colors/theme
vim.opt.termguicolors = true

-- font
vim.opt.guifont = { "FiraCode Nerd Font" }

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- backup/undo/swap
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undodir')
vim.opt.backupdir = vim.fn.expand('~/.config/nvim/backup')
vim.opt.directory = vim.fn.expand('~/.config/nvim/swap')
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
-- disable this junk
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false


-- User commands
-- reload config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
