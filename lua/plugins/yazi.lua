return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require("yazi").setup({
			open_for_directories = true,
			keymaps = {
				show_help = "<f1>",
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
		vim.keymap.set(
			"n",
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			{ desc = "Open the file manager in nvim's working directory" }
		)
	end,
}
