return {
	"mikavilpas/yazi.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		open_for_directories = true,
	},
}
