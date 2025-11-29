return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			signs = false,
		})

		vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>")

		vim.keymap.set("n", "]t", function()
			require("todo-comments").jump_next()
		end)
		vim.keymap.set("n", "[t", function()
			require("todo-comments").jump_prev()
		end)
	end,
}
