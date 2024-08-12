return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
      	"JoosepAlviste/nvim-ts-context-commentstring",
	},
	cmd = "Treesitter",
	main = "nvim-treesitter.configs",
	opts = {
		auto_install = true,
		ensure_installed = {
			"lua",
			"javascript",
			"typescript",
			"css",
			"html",
			"elixir",
			"php",
			"go",
			"gleam",
			"rust",
			"jsdoc",
			"json",
			"markdown",
			"sql",
			"toml",
			"yaml",
			"tsx",
			"vue",
			"svelte",
			"zig",
		},
		highlight = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}
