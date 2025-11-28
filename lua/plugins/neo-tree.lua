return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<cr>")
	end,
}
