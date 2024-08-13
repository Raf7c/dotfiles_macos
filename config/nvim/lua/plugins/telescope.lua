return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },

  keys = {
    { "<leader>f", function() end, mode = {"n", "x"}, desc = "+Files" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      pickers = {
        find_files = {
          theme = theme,
          previewer = false,
        },
        live_grep = {
          theme = theme,
        },
        buffers = {
          previewer = false,
          theme = theme,
        },
      },
      extensions = {
        file_browser = {
          previewer = false,
          theme = theme,
          hijack_netrw = true,
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "ignore_case",
        }
      }
    })

    telescope.load_extension("media_files")
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
  end
}