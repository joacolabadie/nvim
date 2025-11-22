return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			default_component_configs = {
				git_status = {
					symbols = {
						added = "+",
						modified = "~",
						deleted = "-",
						renamed = ">",
						untracked = "?",
						ignored = "i",
						unstaged = "u",
						staged = "s",
						conflict = "!",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left<cr>")
	end,
}
