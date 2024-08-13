return {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = { "DaikyXendo/nvim-material-icon" },
	},
	{ "nacro90/numb.nvim", event = "BufReadPre", config = true },
    {
      "numToStr/Comment.nvim",
      dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
      keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = { "n", "v" } }, { "gbc", mode = { "n", "v" } } },
      config = function(_, _)
        local opts = {
          ignore = "^$",
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
        require("Comment").setup(opts)
      end,
    },
    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
      config = true,
    },
    {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
      config = true,
    },
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
	{
		"andymass/vim-matchup",
		event = { "BufReadPost" },
		config = function()
		  vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	  },
}