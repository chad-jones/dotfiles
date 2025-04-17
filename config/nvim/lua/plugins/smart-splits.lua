return {
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        config = function()
            require("smart-splits").setup({
                multiplexer_integration = "wezterm",
            })
        end,
        keys = {
            -- Move between splits
            {
                "<C-h>",
                function() require("smart-splits").move_cursor_left() end,
                mode = { "n", "v" },
                desc = "Move to left window",
            },
            {
                "<C-j>",
                function() require("smart-splits").move_cursor_down() end,
                mode = { "n", "v" },
                desc = "Move to below window",
            },
            {
                "<C-k>",
                function() require("smart-splits").move_cursor_up() end,
                mode = { "n", "v" },
                desc = "Move to above window",
            },
            {
                "<C-l>",
                function() require("smart-splits").move_cursor_right() end,
                mode = { "n", "v" },
                desc = "Move to right window",
            },
            -- Resize splits
            {
                "<A-h>",
                function() require("smart-splits").resize_left() end,
                mode = { "n", "v" },
                desc = "Resize left window",
            },
            {
                "<A-j>",
                function() require("smart-splits").resize_down() end,
                mode = { "n", "v" },
                desc = "Resize below window",
            },
            {
                "<A-k>",
                function() require("smart-splits").resize_up() end,
                mode = { "n", "v" },
                desc = "Resize above window",
            },
            {
                "<A-l>",
                function() require("smart-splits").resize_right() end,
                mode = { "n", "v" },
                desc = "Resize right window",
            },
        },
    }
}
