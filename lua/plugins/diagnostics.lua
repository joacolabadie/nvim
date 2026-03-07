return {
	{
		"folke/trouble.nvim",
		keys = {
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer diagnostics (Trouble)",
			},
		},
		opts = {
			focus = true,
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		priority = 1000,
		event = "VeryLazy",
		opts = {
			options = {
				multilines = { enabled = true },
				show_source = { enabled = true },
				add_messages = { display_count = true },
			},
		},
		config = function(_, opts)
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "●",
						[vim.diagnostic.severity.WARN] = "●",
						[vim.diagnostic.severity.INFO] = "●",
						[vim.diagnostic.severity.HINT] = "●",
					},
				},
			})

			require("tiny-inline-diagnostic").setup(opts)
		end,
	},
}
