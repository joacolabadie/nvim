return {
	"joacolabadie/neogit-ai-commit.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"NeogitOrg/neogit",
	},
	config = function()
		require("neogit-ai-commit").setup()
	end,
}
