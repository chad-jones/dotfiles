-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = '://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

-- Autocommand that reloads neovim whenever you save the plugins/init.lua file
vim.cmd([[
  augroup packer_cj.config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/cj/plugins/init.lua,~/Dropbox/dotfiles/config/nvim/lua/cj/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}
)

-- run packer
require('packer').startup(function(use)
  -- Package manager
  use { 'wbthomason/packer.nvim' }

  -- impatient
  -- use 'lewis6991/impatient.nvim'

  -- plenary
  use "nvim-lua/plenary.nvim"

  -- ctrlfs
  use { 'dyng/ctrlsf.vim', config = function() require 'cj.plugins.ctrlsf' end }


  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- octo (github)
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  -- lualine statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- onedark theme
  use "olimorris/onedarkpro.nvim"

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- whichkey
  use {
   "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    end
  }

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
  }

  -- neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- hop
  use 'phaazon/hop.nvim'

  -- lsp/cmp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  -- whitespace
  use 'mcauley-penney/tidy.nvim'

  -- golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- floating window support

  -- surround
  use 'kylechui/nvim-surround'

  -- comments
  use 'b3nj5m1n/kommentary'

  -- tabline
  use({
    'crispgm/nvim-tabline',
    config = function()
        require('tabline').setup({})
    end,
  })

  -- move
  use 'fedepujol/move.nvim'

  -- harpoon
  use 'ThePrimeagen/harpoon'

  -- autopairs
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- indent blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- persisted
  use({
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup()
      require("telescope").load_extension("persisted") -- To load the telescope extension
    end,
  })

  -- alpha
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'cj.plugins.dashboard'.config)
    end
  }

  -- telescope frecency
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }

  -- terminal
  use {
   "NvChad/nvterm",
    config = function ()
      require("nvterm").setup()
    end,
  }

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

-- colors/theme
vim.cmd("colorscheme onedark")

-- lualine
require('lualine').setup {
  options = { theme  = 'onedark' },
}

-- impatient
-- require'impatient'.enable_profile()

-- go
require('cj.plugins.go')

-- gitsigns
require('gitsigns').setup()

-- neogit
local neogit = require('neogit').setup()

-- whitespace
require('tidy').setup()

-- lsp/cmp
local lsp = require('lsp-zero')
lsp.preset('recommended')
-- lsp.nvim_workspace()
lsp.setup()

-- treesitter
require('cj.plugins.nvim-treesitter')

-- nvim-tree
require('cj.plugins.nvim-tree')

-- hop
require('hop').setup()

-- surround
require("nvim-surround").setup()

-- comments
require('kommentary.config').setup()
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

vim.g.kommentary_create_default_mappings = false

require("telescope").load_extension('harpoon')

-- indent blankline
require("ibl").setup {
}

-- telescope layout
require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
  },
}
