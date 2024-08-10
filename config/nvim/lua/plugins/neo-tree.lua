return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle reveal position=float<cr>", desc = "Toggle Neotree" },
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
		},
	},
}
