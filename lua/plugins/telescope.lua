return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope find files",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Telescope live grep",
		},
	},
	opts = {
		pickers = {
			find_files = {
				find_command = {
					"fd",
					"--type",
					"f",
					"--hidden",
					"--no-ignore",
					"--color",
					"never",
					"--exclude",
					".git",
					"--exclude",
					"node_modules",
					"--exclude",
					".next",
				},
			},
			live_grep = {
				additional_args = {
					"--hidden",
					"--no-ignore",
					"--glob=!**/.git/*",
					"--glob=!**/node_modules/*",
					"--glob=!**/package-lock.json",
					"--glob=!**/.next/*",
				},
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)

		telescope.load_extension("fzf")
	end,
}
