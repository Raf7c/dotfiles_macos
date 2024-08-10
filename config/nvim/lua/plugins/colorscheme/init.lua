return {
    {
        "folke/styler.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = {
          themes = {
            markdown = { colorscheme = "catppuccin" },
            help = { colorscheme = "catppuccin" },
          },
        },
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            local catppuccin = require("catppuccin")

            catppuccin.setup({
                flavour = "mocha",
                transparent_background = false,
            })

            vim.cmd.colorscheme "catppuccin"
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
          require("gruvbox").setup()
        end,
    },
}