return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local neogit = require("neogit")

		vim.keymap.set("n", "<leader>gg", function()
			neogit.open({ kind = "floating" })
		end, { desc = "Open Neogit (floating)" })
	end,
}
