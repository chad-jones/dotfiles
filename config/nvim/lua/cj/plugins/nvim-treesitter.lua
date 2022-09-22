-- treesitter configuration

require 'nvim-treesitter.configs'.setup {
    -- ensure_installed can be "all" or a list of languages { "python", "javascript" }
    ensure_installed = { "python", "bash", "javascript", "cmake", "go", "java", "dockerfile", "fish", "gitignore", "gitattributes", "json", "lua", "php", "typescript", "yaml", "vim" },

    highlight = { -- enable highlighting for all file types
        enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
    },
    incremental_selection = {
        enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
        keymaps = { -- mappings for incremental selection (visual mappings)
            init_selection = "<C-s>", -- maps in normal mode to init the node/scope selection
            node_incremental = "<C-s>", -- increment to the upper named parent
            scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
            node_decremental = "<C-S-s>", -- decrement to the previous node
        }
    },
    textobjects = {
        -- These are provided by
        select = {
            enable = true, -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
            keymaps = {
                -- You can use the capture groups defined here:
                -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["as"] = "@statement.outer",
                ["is"] = "@statement.inner",
            },
        },
    },
}
-- treesitter folds workaround
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND


