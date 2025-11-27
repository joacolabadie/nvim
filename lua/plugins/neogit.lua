return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local neogit = require("neogit")

		vim.keymap.set("n", "<leader>gs", function()
			neogit.open({ kind = "floating" })
		end)
	end,
}
