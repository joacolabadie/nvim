return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
		opts = {},
	},
}
