return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
                lualine_y = {
                    { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = {
                    {
                        function()
                            local icons = { [0] = "󱑖 ", [1] = "󱑋 ", [2] = "󱑌 ", [3] = "󱑍 ", [4] = "󱑎 ", [5] = "󱑏 " , [6] = "󱑐 ",
                            [7] = "󱑑 ", [8] = "󱑒 ", [9] = "󱑓 ", [10] = "󱑔 ", [11] = "󱑕 ", [12] = "󱑖 ", [13] = "󱑋 ", [14] =
                            "󱑌 ", [15] = "󱑍 ", [16] = "󱑎 ", [17] = "󱑏 ", [18] = "󱑐 ", [19] = "󱑑 ", [20] = "󱑒 ", [21] = "󱑓 ", [22] =
                            "󱑔 ", [23] = "󱑕 " }
                            local hour = os.date("*t").hour
                            local icon = icons[hour]
                            return icon .. os.date("%R")
                        end,
                        separator = { right = "", left = "" },
                    },
                },
            },
        },
    },
}
