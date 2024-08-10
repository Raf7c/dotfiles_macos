return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = true,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},

		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = function()
			local hi = require("mini.hipatterns")
			return {
				highlighters = {
					hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = true,
	},
}
