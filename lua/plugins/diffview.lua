return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
		vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>")
		vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>")
	end,
}
