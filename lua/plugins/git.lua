return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local neogit = require("neogit")

			vim.keymap.set("n", "<leader>gg", function()
				neogit.open({ kind = "floating" })
			end, { desc = "Open Neogit (floating)" })
		end,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open git diff" })
			vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close git diff" })
			vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "File history" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "-" },
					topdelete = { text = "-" },
					changedelete = { text = "~" },
				},
			})
		end,
	},
}
