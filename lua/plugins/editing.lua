return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()

			vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")
			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end)
			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end)
		end,
	},
}
