return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open git diff" })
		vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close git diff" })
	end,
}
