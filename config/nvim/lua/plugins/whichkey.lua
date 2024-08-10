return {
    "folke/which-key.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    event = "VeryLazy",
    opts = {
      setup = {
        show_help = true,
        plugins = { spelling = true },
        key_labels = { ["<leader>"] = "SPC" },
        triggers = "auto",
        window = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 3, -- spacing between columns
          align = "left", -- align columns left, center or right
        },
      },
      defaults = {
        prefix = "<leader>",
        mode = { "n", "v" },
        w = { "<cmd>update!<CR>", "Save" },
        q = { name = "Quit/Session",
          q = { "<cmd>q!<CR>", "Quit" },
          t = { "<cmd>tabclose<cr>", "Close Tab" },
        },
        d = { name = "+Debug" },
        f = { name = "+File" },
        g = { name = "+Git" },
        t = { name = "+Test", N = { name = "+Neotest" }, o = { "+Overseer" } },
        z = { name = "+System" }, 

        l = {
          name = "+Language",
         --g = { name = "Annotation" },
        },
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts.setup)
      wk.register(opts.defaults)
    end,
}